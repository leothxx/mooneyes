package com.spring.green2209S_09.service;

import java.util.ArrayList;

import com.spring.green2209S_09.vo.ServiceVO;

public interface ServiceService {

	public int set_mooneyes_service_input(ServiceVO vo);

	public ArrayList<ServiceVO> get_mooneyes_service_search(int member_idx);

	public ServiceVO get_mooneyes_service_view(int service_idx);

}
