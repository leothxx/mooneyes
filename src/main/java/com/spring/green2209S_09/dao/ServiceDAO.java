package com.spring.green2209S_09.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.green2209S_09.vo.ServiceVO;

public interface ServiceDAO {

	public int set_mooneyes_service_input(@Param("vo") ServiceVO vo);

	public ArrayList<ServiceVO> get_mooneyes_service_search(@Param("member_idx") int member_idx);

	public ServiceVO get_mooneyes_service_view(@Param("service_idx") int service_idx);
	
}
