package com.spring.green2209S_09.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.green2209S_09.dao.ServiceDAO;
import com.spring.green2209S_09.vo.ServiceVO;

@Service
public class ServiceServiceImpl implements ServiceService {
	@Autowired
	ServiceDAO serviceDAO;

	@Override
	public int set_mooneyes_service_input(ServiceVO vo) {
		return serviceDAO.set_mooneyes_service_input(vo);
	}

	@Override
	public ArrayList<ServiceVO> get_mooneyes_service_search(int member_idx) {
		return serviceDAO.get_mooneyes_service_search(member_idx);
	}

	@Override
	public ServiceVO get_mooneyes_service_view(int service_idx) {
		return serviceDAO.get_mooneyes_service_view(service_idx);
	}
}
