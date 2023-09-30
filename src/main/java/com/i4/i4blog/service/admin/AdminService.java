package com.i4.i4blog.service.admin;

import com.i4.i4blog.repository.interfaces.admin.AdminRepository;
import com.i4.i4blog.repository.model.admin.AdminReportVO;
import com.i4.i4blog.repository.model.admin.DateCountDTO;
import com.i4.i4blog.util.Criteria;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Slf4j
@Service
public class AdminService {
    private final AdminRepository adminRepository;


    public DateCountDTO getDateCountDTO(){
        return adminRepository.dateCount();
    }

    public List<AdminReportVO> getReportList(Criteria criteria){
        return adminRepository.getReportList(criteria);
    }
    public Integer getReportTotalCount(Criteria criteria){
        return adminRepository.count(criteria);
    }

}
