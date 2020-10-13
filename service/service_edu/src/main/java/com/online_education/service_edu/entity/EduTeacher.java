package com.online_education.service_edu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableLogic;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 讲师
 * </p>
 *
 * @author XD
 * @since 2020-09-08
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="EduTeacher对象", description="讲师")
public class EduTeacher implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "TeacherID")
    @TableId(value = "id", type = IdType.ID_WORKER)
    private String id;

    @ApiModelProperty(value = "TeacherName")
    private String name;

    @ApiModelProperty(value = "TeacherIntro")
    private String intro;

    @ApiModelProperty(value = "TeacherExperience")
    private String career;

    @ApiModelProperty(value = "Title1SeniorTeacher 2HonorTeacher")
    private Integer level;

    @ApiModelProperty(value = "TeacherPhoto")
    private String avatar;

    @ApiModelProperty(value = "Sort")
    private Integer sort;

    @ApiModelProperty(value = "LogicDele 1true, 0false")
    @TableLogic
    private Boolean isDeleted;

    @ApiModelProperty(value = "CreateTime")
    private Date gmtCreate;

    @ApiModelProperty(value = "UpdateTime")
    private Date gmtModified;


}
