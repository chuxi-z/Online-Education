package com.online_education.service_edu.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class TeacherQuery {
    @ApiModelProperty(value = "Teacher Name like")
    private String name;

    @ApiModelProperty(value = "Teacher Experience 1/2")
    private Integer level;

    @ApiModelProperty(value = "Search Time Begin", example = "2020-09-18 03:05:10")
    private String begin;

    @ApiModelProperty(value = "Search Time End", example = "2020-09-20 03:05:10")
    private String end;

}
