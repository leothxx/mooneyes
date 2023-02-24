package com.spring.green2209S_09.service;

import java.util.ArrayList;

import com.spring.green2209S_09.vo.ServiceVO;
import com.spring.green2209S_09.vo.Service_answerVO;

public interface ServiceService {

	public int set_mooneyes_service_input(ServiceVO vo);

	public ArrayList<ServiceVO> get_mooneyes_service_search(int member_idx);

	public ServiceVO get_mooneyes_service_view(int service_idx);

	public int set_mooneyes_service_update(ServiceVO vo);

	public int get_mooneyes_service_delete(int service_idx);

	public int set_mooneyes_service_answer_input(Service_answerVO vo);

	public ArrayList<Service_answerVO> get_mooneyes_service_answer(int service_idx);

}
