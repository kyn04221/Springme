package com.busanit501.boot501.dto;

import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RecipeDTO {
    private  Long recipeid;
    @NotEmpty
    private  String recipename;
    @NotEmpty
    private  String ingredients;
    @NotEmpty
    private  String method;
    @NotEmpty
    private  String writer;

    private  String urlsource;
    private LocalDateTime createday;
    private LocalDateTime updateday;
}
