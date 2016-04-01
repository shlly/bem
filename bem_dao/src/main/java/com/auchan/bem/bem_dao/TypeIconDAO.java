package com.auchan.bem.bem_dao;

import org.apache.ibatis.annotations.Param;

public interface TypeIconDAO {
	
    Short selectTypeIdBySuffix(@Param("suffix")String suffix);
    
    Short selectUnKnownTypeId();
    
    Short selectDirectoryTypeId();
}