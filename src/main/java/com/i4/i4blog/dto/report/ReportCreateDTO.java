package com.i4.i4blog.dto.report;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class ReportCreateDTO {
	private Integer userId;
	private Integer boardId;
	private Integer commentId;
	private String reportContent;
}
