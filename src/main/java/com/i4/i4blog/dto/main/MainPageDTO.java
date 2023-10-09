package com.i4.i4blog.dto.main;

import com.i4.i4blog.repository.model.main.MainDTO;
import com.i4.i4blog.util.Criteria;
import com.i4.i4blog.util.PageDTO;
import lombok.*;

import java.util.List;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class MainPageDTO {

    private List<MainDTO> mainDTOList;
    private PageDTO PageDTO;


}
