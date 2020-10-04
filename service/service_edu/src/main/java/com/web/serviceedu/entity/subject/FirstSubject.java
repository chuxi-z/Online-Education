package com.web.serviceedu.entity.subject;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class FirstSubject {
    private String id;

    private String title;

    private List<SecondSubject> children = new ArrayList<>();
}
