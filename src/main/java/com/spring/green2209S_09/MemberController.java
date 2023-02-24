package com.spring.green2209S_09;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.green2209S_09.service.CartService;
import com.spring.green2209S_09.service.MemberService;
import com.spring.green2209S_09.service.ProductService;
import com.spring.green2209S_09.vo.AddressVO;
import com.spring.green2209S_09.vo.CartVO;
import com.spring.green2209S_09.vo.MemberVO;
import com.spring.green2209S_09.vo.ProductAllVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	// 약관 동의창
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinGet(Model model) {
		return "member/mooneyes_join";
	}

	// 회원 가입창
	@RequestMapping(value="/join2", method=RequestMethod.GET)
	public String join2Get(Model model, String member_sms_check, String member_email_check) {
		model.addAttribute("member_sms_check",member_sms_check);
		model.addAttribute("member_email_check",member_email_check);
		return "member/mooneyes_join2";
	}
	
	// 회원 가입창
	@RequestMapping(value="/join3", method=RequestMethod.GET)
	public String join3Get() {
		return "member/mooneyes_join3";
	}
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/idCheck",method=RequestMethod.POST)
	public String idCheckPost(String member_mid) {
		int res = 0;
		MemberVO vo = memberService.get_mooneyes_member_check(member_mid);
		if(vo == null) res = 1;
		return res+"";
	}
	
	// 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value="/emailCheck",method=RequestMethod.POST)
	public String emailCheckPost(String member_email) {
		int res = 1;
		MemberVO vo = memberService.get_mooneyes_member_emailCheck(member_email);
		if(vo != null) res = 0;
		return res+"";
	}
	
	// 회원 가입
	@RequestMapping(value="/join2", method=RequestMethod.POST)
	public String join2Post(HttpServletRequest request, Model model, MemberVO vo) throws MessagingException {
		
		// 회원가입 이메일 인증 키 만들기
		UUID uid = UUID.randomUUID();
		String email_key = uid.toString().substring(0,8);
		vo.setMember_email_key(email_key);
		
		// 메일 전송
		try {
			String toMail = vo.getMember_email();
			String title = vo.getMember_name()+"님 Mooneyes 가입 이메일 인증 코드 입니다.";
			
			// 메일을 전송하기위한 객체 : MimeMessage() , MimeMessageHelper()
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			// 메일보관함에 회원이 보내온 메세지들을 모두 저장시킨다.
			messageHelper.setTo(toMail);
			messageHelper.setSubject(title);
			
			// 메세지 보관함의 내용(content)에 필요한 정보를 추가로 담아서 전송시킬수 있도록 한다.
			String content = "<br><hr><h3>Mooneyes 가입 이메일 인증 코드 입니다.</h3><hr><br>";
			content += "<p>인증번호 : <h3><font color='blue'>"+vo.getMember_email_key()+"</font></h3></p>";
			content += "<p>방문하기 : <a href='http://49.142.157.251:9090/green2209S_09/'>mooneyes 바로가기</a></p>";
			content += "<hr>";
			message.setText(content, "utf-8", "html");
			
			// 메일 전송하기
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
			return "redirect:/msg/mailError?mid="+vo.getMember_name();
		}
		
		// 아이디 중복체크
		if(memberService.get_mooneyes_member_check(vo.getMember_mid()) != null) {
			return "redirect:/msg/memberIdCheckNo";
		}
		
		// 이메일 중복체크
		if(memberService.get_mooneyes_member_emailCheck(vo.getMember_email()) != null) {
			return "redirect:/msg/memberEmailCheckNo";
		}
		
		// 비밀번호 암호화(BCryptPasswordEncoder)
		vo.setMember_pwd(passwordEncoder.encode(vo.getMember_pwd()));
		
		// 회원가입 처리 (DB저장)
		vo.setMember_sms_check(vo.getMember_sms_check().substring(0,1));
		vo.setMember_email_check(vo.getMember_email_check().substring(0,1));
		memberService.set_mooneyes_member_join(vo);
		
		model.addAttribute("vo",vo);
		return "member/mooneyes_join3";
	}
	
	// 로그인 창
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String loginGet(HttpServletRequest request) {
		// 로그인폼 호출시에 기존에 저장된 쿠키가 있다면 불러와서 mid에 담아서 넘겨준다.
		Cookie[] cookies = request.getCookies();
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				request.setAttribute("mid", cookies[i].getValue());
				break;
			}
		}
		return "member/mooneyes_login";
	}
	
	// 로그인 처리
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String loginPost(HttpServletRequest request, HttpServletResponse response , HttpSession session,
			@RequestParam(name="member_mid", defaultValue = "", required = false) String member_mid,
			@RequestParam(name="member_pwd", defaultValue = "", required = false) String member_pwd,
			@RequestParam(name="mid_save", defaultValue = "", required = false) String mid_save) {
		
		MemberVO vo = memberService.get_mooneyes_member_check(member_mid);
		int basket = cartService.get_member_cart_count(vo.getMember_idx());
		if(vo != null && passwordEncoder.matches(member_pwd, vo.getMember_pwd()) && vo.getMember_delete_check().equals("N")) {
			String strLevel = "";
			if(vo.getMember_level() == 0) strLevel = "준회원";
			else if(vo.getMember_level() == 1) strLevel = "정회원";
			else if(vo.getMember_level() == 2) strLevel = "우수회원";
			else if(vo.getMember_level() == 3) strLevel = "운영자";
			else if(vo.getMember_level() == 4) strLevel = "관리자";
			
			session.setAttribute("sLevel", vo.getMember_level());
			session.setAttribute("sStrLevel", strLevel);
			session.setAttribute("sMid", member_mid);
			session.setAttribute("sIdx", vo.getMember_idx());
			session.setAttribute("sName", vo.getMember_name());
			session.setAttribute("basket", basket);
			
			if(mid_save.equals("on")) {
				Cookie cookie = new Cookie("cMid", member_mid);
				cookie.setMaxAge(60*60*24*7);
				response.addCookie(cookie);
			}
			else {
				Cookie[] cookies = request.getCookies();
				for(int i=0; i<cookies.length; i++) {
					if(cookies[i].getName().equals("cMid")) {
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
						break;
					}
				}
			}
			
			// 로그인한 사용자의 방문 IP와 방문날짜 업데이트
			memberService.set_member_visit_update(vo);
			String name = null;
			try {
				name = URLEncoder.encode(vo.getMember_name(),"utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			return "redirect:/msg/mooneyes_login_ok?mid="+name;
		}
		else {
			return "redirect:/msg/mooneyes_login_no";
		}
	}
	
	// 카카오 로그인 처리
	@RequestMapping(value="/kakao_login", method=RequestMethod.GET)
	public String kakao_loginGet(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			String member_name,
			String member_email,
			String member_signIp) {
		
		// 카카오로그인한 회원이 현재 우리 회원인지를 조회한다.
		// 이미 가입된 회원이라면 서비스를 사용하게 하고, 그렇지 않으면 강제로 회원 가입시킨다.
		MemberVO vo = memberService.get_member_nameEmail_Check(member_name, member_email);
		
		// 현재 우리회원이 아니면 자동회원가입처리..(가입필수사항: 아이디,닉네임,이메일) - 아이디는 이메일주소의 '@'앞쪽 이름을 사용하기로 한다.
		if(vo == null) {
			// 아이디 결정하기
			String mid = member_email.substring(0, member_email.indexOf("@"));
			
			// 임시 비밀번호 발급하기(UUID 8자리로 발급하기로 한다. -> 발급후 암호화시켜 DB에 저장)
			UUID uid = UUID.randomUUID();
			String pwd2 = uid.toString().substring(0,8);
			session.setAttribute("sImsiPwd", pwd2);	// 임시비밀번호를 발급하여 로그인후 변경처리하도록 한다.
			String pwd = passwordEncoder.encode(pwd2);
			
			// 이메일 인증키 발급하기
			uid = UUID.randomUUID();
			String email_key = uid.toString().substring(0,8);
			
			// 새로 발급된 임시비밀번호를 메일로 전송처리한다.
			try {
				String toMail = member_email;
				String title = member_name+"님 Mooneyes 가입 이메일 인증 코드 및 임시 비밀번호 입니다.";
				
				// 메일을 전송하기위한 객체 : MimeMessage() , MimeMessageHelper()
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				// 메일보관함에 회원이 보내온 메세지들을 모두 저장시킨다.
				messageHelper.setTo(toMail);
				messageHelper.setSubject(title);
				
				// 메세지 보관함의 내용(content)에 필요한 정보를 추가로 담아서 전송시킬수 있도록 한다.
				String content = "<br><hr><h3>Mooneyes 가입 이메일 인증 코드 및 임시비밀번호 입니다.</h3><hr><br>";
				content += "<p>인증번호 : <h3><font color='blue'>"+email_key+"</font></h3></p>";
				content += "<p>임시비밀번호 : <h3><font color='red'>"+pwd2+"</font></h3></p>";
				content += "<p>방문하기 : <a href='http://49.142.157.251:9090/green2209S_09/'>mooneyes 바로가기</a></p>";
				content += "<hr>";
				content += "<p>가입된 아이디는 가입하신 카카오 email의 @ 앞부분이 아이디이며,</p>";
				content += "<p>임시 비밀번호는 분실 위험이 있으니, 꼭 비밀번호 변경 후 이용해주세요.</p>";
				content += "<hr>";
				message.setText(content, "utf-8", "html");
				
				// 메일 전송하기
				mailSender.send(message);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			vo = new MemberVO();
			// 자동 회원 가입처리한다.
			vo.setMember_mid(mid);
			vo.setMember_pwd(pwd);
			vo.setMember_name(member_name);
			vo.setMember_email(member_email);
			vo.setMember_signIp(member_signIp);
			vo.setMember_phone("010-0000-0000");
			vo.setMember_email_key(email_key);
			memberService.set_kakao_Member_InputOk(vo);
			
			// 가입 처리된 회원의 정보를 다시 읽어와서 vo에 담아준다.
			vo = memberService.get_mooneyes_member_check(mid);
		}
		
		// 만약에 탈퇴신청한 회원이 카카오로그인처리하였다라면 'userDel'필드를 'NO'로 업데이트한다.
		if(!vo.getMember_delete_check().equals("N")) {
			memberService.set_member_userDelCheck(vo.getMember_mid());
		}
		
		int basket = cartService.get_member_cart_count(vo.getMember_idx());
		
		// 회원 인증처리된 경우 수행할 내용? strLevel처리, session에 필요한 자료를 저장, 쿠키값처리, 그날 방문자수 1 증가(방문포인트도 증가), ..
		String strLevel = "";
		if(vo.getMember_level() == 0) strLevel = "준회원";
		else if(vo.getMember_level() == 1) strLevel = "정회원";
		else if(vo.getMember_level() == 2) strLevel = "우수회원";
		else if(vo.getMember_level() == 3) strLevel = "운영자";
		else if(vo.getMember_level() == 4) strLevel = "관리자";
		
		session.setAttribute("sLevel", vo.getMember_level());
		session.setAttribute("sStrLevel", strLevel);
		session.setAttribute("sMid", vo.getMember_mid());
		session.setAttribute("sIdx", vo.getMember_idx());
		session.setAttribute("sName", vo.getMember_name());
		session.setAttribute("basket", basket);
		
		// 로그인한 사용자의 방문 IP와 방문날짜 업데이트
		memberService.set_member_visit_update(vo);
		
		String name = null;
		try {
			name = URLEncoder.encode(vo.getMember_name(),"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return "redirect:/msg/mooneyes_login_ok?mid="+name;
	}
	
	// 로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logoutGet(HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		
		MemberVO vo = memberService.get_mooneyes_member_check(mid);
		
		session.invalidate();
		String name = null;
		try {
			name = URLEncoder.encode(vo.getMember_name(),"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:/msg/mooneyes_logout?mid="+name;
	}
	
	// 마이페이지
	@RequestMapping(value="/mypage",method=RequestMethod.GET)
	public String mypageGet(Model model, String id) {
		MemberVO vo = memberService.get_mooneyes_member_check(id);
		model.addAttribute("vo",vo);
		return "member/mooneyes_mypage";
	}
	
	// 회원 정보 수정
	@RequestMapping(value="/my_info",method=RequestMethod.GET)
	public String my_infoGet(Model model, String mid) {
		MemberVO vo = memberService.get_mooneyes_member_check(mid);
		if(vo != null) {
			if(vo.getMember_address() != null) {
				String member_address[] = vo.getMember_address().split("/");
				model.addAttribute("member_address1",member_address[0]);
				model.addAttribute("member_address2",member_address[1]);
				model.addAttribute("member_address3",member_address[2]);
				model.addAttribute("member_address4",member_address[3]);
			}
			if(vo.getMember_tel() != null) {
				String member_tel[] = vo.getMember_tel().split("-");
				model.addAttribute("member_tel1",member_tel[0]);
				model.addAttribute("member_tel2",member_tel[1]);
				model.addAttribute("member_tel3",member_tel[2]);
			}
			if(vo.getMember_phone() != null) {
				String member_phone[] = vo.getMember_phone().split("-");
				model.addAttribute("member_phone1",member_phone[0]);
				model.addAttribute("member_phone2",member_phone[1]);
				model.addAttribute("member_phone3",member_phone[2]);
			}
		}
		model.addAttribute("vo",vo);
		
		return "member/mooneyes_my_info";
	}
	
	// 회원 정보 수정 처리
	@RequestMapping(value="/my_info", method=RequestMethod.POST)
	public String my_infoPost(Model model, MemberVO vo, String pwd_change_sw, String member_new_pwd, String member_new_pwd2) {
		String name = null;
		try {
			name = URLEncoder.encode(vo.getMember_name(),"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		if(pwd_change_sw.equals("no")) {
			memberService.set_member_update(vo);
			String addr[] = vo.getMember_address().split("/");
			String postcode = addr[0].trim();
			String roadAddress = addr[1];
			String detailAddress = addr[2];
			String extraAddress = addr[3];
			memberService.set_member_address_normal_reset(vo);
			memberService.set_member_address_input(vo.getMember_idx(), vo.getMember_name(), postcode, roadAddress, detailAddress, extraAddress);
			return "redirect:/msg/member_update_ok?mid="+name;
		}
		else {
			if(member_new_pwd.equals(member_new_pwd2)) {
				vo.setMember_pwd(passwordEncoder.encode(member_new_pwd));
				memberService.set_member_pwd_update(vo);
				String addr[] = vo.getMember_address().split("/");
				String postcode = addr[0].trim();
				String roadAddress = addr[1];
				String detailAddress = addr[1];
				String extraAddress = addr[1];
				memberService.set_member_address_normal_reset(vo);
				memberService.set_member_address_input(vo.getMember_idx(), vo.getMember_name(), postcode, roadAddress, detailAddress, extraAddress);
				return "redirect:/msg/member_update_ok?mid="+name;
			}
		}
		return "redirect:/msg/member_update_no?mid="+name;
	}
	
	// 환불 계좌 수정
	@ResponseBody
	@RequestMapping(value="/refund_update",method=RequestMethod.POST)
	public String refund_updatePost(MemberVO vo) {
		int res = 0;
		res = memberService.set_member_refund_update(vo);
		return res+"";
	}
	
	// 이전 비밀번호 확인
	@ResponseBody
	@RequestMapping(value="/before_pwd_check",method=RequestMethod.POST)
	public String before_pwd_checkPost(String member_before_pwd, String member_mid) {
		int res = 0;
		MemberVO vo = memberService.get_mooneyes_member_check(member_mid);
		if(passwordEncoder.matches(member_before_pwd, vo.getMember_pwd())) {
			res = 1;
		}
		return res+"";
	}
	
	// 이메일 인증 처리 폼
	@RequestMapping(value="/email_certification", method=RequestMethod.GET)
	public String email_certificationGet(HttpSession session, Model model) {
		String member_mid = session.getAttribute("sMid") == null ? "" : (String) session.getAttribute("sMid");
		MemberVO vo = memberService.get_mooneyes_member_check(member_mid);
		if(vo.getMember_certification().equals("N")) {
			model.addAttribute("vo",vo);
			return "member/mooneyes_email_certification";
		}
		else {
			String name = null;
			try {
				name = URLEncoder.encode(vo.getMember_name(),"utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			return "redirect:/msg/email_certification_no?mid="+name;
		}
	}
	
	// 이메일 인증 처리
	@RequestMapping(value="/email_certification", method=RequestMethod.POST)
	public String email_certificationPost(HttpSession session, Model model, String code) {
		String member_mid = session.getAttribute("sMid") == null ? "" : (String) session.getAttribute("sMid");
		MemberVO vo = memberService.get_mooneyes_member_check(member_mid);
		if(!vo.getMember_email_key().equals(code)) {
			return "redirect:/msg/email_certification_x";
		}
		else {
			memberService.set_member_email_certification(vo);
			String name = null;
			try {
				name = URLEncoder.encode(vo.getMember_name(),"utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			return "redirect:/msg/email_certification_ok?mid="+name;
		}
	}
	
	// 상품 장바구니에 담기
	@RequestMapping(value="/cart_input",method=RequestMethod.GET)
	public String cart_inputGet(HttpSession session, int product_point, int product_vat, String buy_totPrice, String buy_size, String buy_color, String buy_su, int product_idx) {
		String mid = session.getAttribute("sMid") == null ? "" :  (String) session.getAttribute("sMid");
		ProductAllVO product_vo = productService.get_product_search(product_idx+"");
		MemberVO member_vo = memberService.get_mooneyes_member_check(mid);
		CartVO vo = new CartVO();
		
		// 장바구니 DB에 저장 처리
		String product_count[] = buy_su.split("/");
		String product_size[] = buy_size.split("/");
		String product_color[] = buy_color.split("/");
		if(product_count.length == product_size.length && product_count.length == product_color.length) {
			for(int i=0; i<product_count.length; i++) {
				vo.setMember_idx(member_vo.getMember_idx());
				vo.setProduct_idx(product_idx);
				vo.setProduct_name(product_vo.getProduct_name());
				vo.setProduct_price(product_vo.getProduct_price());
				vo.setProduct_sale_price(product_vo.getProduct_sale_price());
				vo.setProduct_point(product_point);
				vo.setProduct_vat(product_vat);
				vo.setProduct_size(product_size[i]);
				vo.setProduct_color(product_color[i]);
				vo.setProduct_count(Integer.parseInt(product_count[i]));
				
				memberService.set_member_cart(vo);
			}
		}
		
		// 장바구니 개수 세션에 최신화
		int basket = cartService.get_member_cart_count(vo.getMember_idx());
		session.setAttribute("basket", basket);
		
		return "redirect:/msg/cart_ok?mid="+product_idx;
	}
	
	// 장바구니 이동
	@RequestMapping(value="/cart",method=RequestMethod.GET)
	public String cartGet(Model model, HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String) session.getAttribute("sMid");
		MemberVO vo = memberService.get_mooneyes_member_check(mid);
		ArrayList<CartVO> vos = cartService.get_member_cart_list(vo.getMember_idx());
		ArrayList<ProductAllVO> product_vos = new ArrayList<>();
		if(vos != null) {
			for(int i=0; i<vos.size(); i++) {
				ProductAllVO product_vo = productService.get_product_search(vos.get(i).getProduct_idx()+"");
				product_vos.add(product_vo);
			}
		}
		model.addAttribute("product_vos",product_vos);
		model.addAttribute("vos",vos);
		return "member/mooneyes_member_cart";
	}
	
	// 배송 주소록 관리 폼
	@RequestMapping(value="/address", method=RequestMethod.GET)
	public String addressGet(HttpSession session, Model model) {
		String mid = session.getAttribute("sMid") == null ? "": (String) session.getAttribute("sMid");
		MemberVO vo = memberService.get_mooneyes_member_check(mid);
		ArrayList<AddressVO> address_vos = memberService.get_mooneyes_member_address(vo.getMember_idx());
		model.addAttribute("vos",address_vos);
		return "member/mooneyes_member_address";
	}
	
	// 배송 주소록 추가 폼
	@RequestMapping(value="/address_input",method=RequestMethod.GET)
	public String address_inputGet(HttpSession session, Model model) {
		String mid = session.getAttribute("sMid") == null ? "" : (String) session.getAttribute("sMid");
		MemberVO vo = memberService.get_mooneyes_member_check(mid);
		model.addAttribute("member_idx",vo.getMember_idx());
		return "member/mooneyes_member_address_input";
	}
	
	// 배송 주소록 추가 등록 처리
	@RequestMapping(value="/address_input",method=RequestMethod.POST)
	public String address_inputPost(HttpSession session, Model model, AddressVO address_vo) {
		String mid = session.getAttribute("sMid") == null ? "" : (String) session.getAttribute("sMid");
		MemberVO vo = memberService.get_mooneyes_member_check(mid);
		address_vo.setMember_idx(vo.getMember_idx());
		
		// 기본 배송지로 설정했을 경우 기존에 있는 배송지 중 기본 배송지를 삭제함.
		if(address_vo.getMember_address_sw().equals("Y")) {
			// 기본 배송지로 설정했을 경우에 회원 정보에 있는 주소를 수정함.
			String postcode = address_vo.getMember_address_postcode()+"/";
			String roadAddress = address_vo.getMember_address_roadAddress()+"/";
			String detailAddress = address_vo.getMember_address_detailAddress()+"/";
			String extraAddress = address_vo.getMember_address_extraAddress()+"/ ";
			String address = postcode + roadAddress + detailAddress + extraAddress;
			memberService.set_member_address_update(vo.getMember_idx(), address);
			memberService.set_member_address_normal_reset(vo);
		}
		
		// 주소록 DB에 저장처리
		int res = 0;
		res = memberService.set_mooneyes_member_address_input(address_vo);
		
		if(res == 1) return "redirect:/msg/member_address_inputOk";
		
		return "redirect:/msg/member_address_inputNo";
	}
	
	// 기본 배송지 변경처리
	@Transactional
	@ResponseBody
	@RequestMapping(value="/member_address_normal_update",method = RequestMethod.POST)
	public String member_address_normal_updatePost(HttpSession session ,int member_address_idx) {
		String mid = session.getAttribute("sMid") == null ? "" : (String) session.getAttribute("sMid");
		MemberVO vo = memberService.get_mooneyes_member_check(mid);
		int res = 0;
		// 기본 배송지를 없앤다.
		memberService.set_member_address_normal_reset(vo);
		// 기본 배송지로 설정한다.
		res = memberService.set_member_address_normal_set(member_address_idx);
		return res+"";
	}
	
	// 배송지 수정 폼
	@RequestMapping(value="/member_address_edit",method=RequestMethod.GET)
	public String member_address_editGet(Model model, int member_address_idx) {
		AddressVO vo = memberService.get_mooneyes_address_search(member_address_idx);
		model.addAttribute("vo",vo);
		return "member/mooneyes_member_address_edit";
	}
	
	// 배송지 수정 처리
	@Transactional
	@RequestMapping(value="/member_address_edit",method=RequestMethod.POST)
	public String member_address_editPost(Model model, HttpSession session, AddressVO vo) {
		String mid = (String) session.getAttribute("sMid");
		MemberVO member_vo = memberService.get_mooneyes_member_check(mid);
		int res = 0;
		
		if(vo.getMember_address_sw().equals("Y")) {
			// 기본 배송지로 설정했을 경우 기존에 있는 배송지 중 기본 배송지를 삭제함.
			memberService.set_member_address_normal_reset(member_vo);
			
			// 기본 배송지로 설정했을 경우에 회원 정보에 있는 주소를 수정함.
			String postcode = vo.getMember_address_postcode()+"/";
			String roadAddress = vo.getMember_address_roadAddress()+"/";
			String detailAddress = vo.getMember_address_detailAddress()+"/";
			String extraAddress = vo.getMember_address_extraAddress()+"/ ";
			String address = postcode + roadAddress + detailAddress + extraAddress;
			memberService.set_member_address_update(member_vo.getMember_idx(), address);
		}
		
		res = memberService.get_mooneyes_address_update(vo);
		model.addAttribute("vo",vo);
		if(res == 1) {
			return "redirect:/msg/address_update_ok";
		}
		return "redirect:/msg/address_update_no";
	}
	
	
}
