package com.auchan.bem.bem_service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.auchan.bem.bem_dao.AreaDAO;
import com.auchan.bem.bem_dao.DivisionDAO;
import com.auchan.bem.bem_pojo.entity.Area;
import com.auchan.bem.bem_pojo.entity.Division;
import com.auchan.bem.bem_pojo.entity.Section;
import com.auchan.bem.bem_service.BaseDataService;

/**
 * 基础数据service实现类
 * 
 * @date 2016-03-14
 * @author 郑冉
 *
 */
@Service
public class BaseDataServiceImpl implements BaseDataService {
	
	@Resource
	private DivisionDAO divisionDAO;
	
	@Resource
	private AreaDAO areaDAO;

	@Override
	public List<Division> getDivision() {
		return divisionDAO.selectAll();
	}

	@Override
	public List<Section> getSection(Short divisionNo) {
		return divisionDAO.selectSectionByDivisionNo(divisionNo);
	}

	@Override
	public List<Area> getStore() {
		return areaDAO.selectAll();
	}
}
