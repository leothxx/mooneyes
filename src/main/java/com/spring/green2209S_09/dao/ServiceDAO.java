package com.spring.green2209S_09.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.green2209S_09.vo.ServiceVO;
import com.spring.green2209S_09.vo.Service_answerVO;

public interface ServiceDAO {

	public int set_mooneyes_service_input(@Param("vo") ServiceVO vo);

	public ArrayList<ServiceVO> get_mooneyes_service_search(@Param("member_idx") int member_idx);

	public ServiceVO get_mooneyes_service_view(@Param("service_idx") int service_idx);

	public int get_mooneyes_service_update(@Param("vo") ServiceVO vo);

	public int get_mooneyes_service_delete(@Param("service_idx") int service_idx);

	public int set_mooneyes_service_answer_input(@Param("vo") Service_answerVO vo);

	public ArrayList<Service_answerVO> get_mooneyes_service_answer(@Param("service_idx") int service_idx);
	
}
