package com.i4.i4blog.db.admin.interfaces;

import com.i4.i4blog.db.admin.model.Report;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReportRepository {

    List<Report> reports();


}
