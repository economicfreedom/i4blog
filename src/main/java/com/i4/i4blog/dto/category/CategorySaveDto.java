package com.i4.i4blog.dto.category;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class CategorySaveDto {
	private Integer id;
	private Integer userId;
	private String categoryName;
	private String state;
	private Integer order;
}
