package com.i4.i4blog.repository.interfaces.report;

import org.apache.ibatis.annotations.Mapper;

import com.i4.i4blog.repository.model.report.Report;

@Mapper
public interface ReportRepository {
	public int insert(Report report);
}
