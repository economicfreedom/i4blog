package com.i4.i4blog.repository.model.report;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Report {
	private Integer id;
	private Integer userId;
	private Integer boardId;
	private Integer commentId;
	private String reportContent;
	private String reportType;
	private Timestamp reportCreatedAt;
	
}
