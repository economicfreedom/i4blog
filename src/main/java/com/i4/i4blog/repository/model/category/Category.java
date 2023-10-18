package com.i4.i4blog.repository.model.category;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Category {
	private Integer id;
	private Integer userId;
	private String categoryName;
	private Integer order;
}
