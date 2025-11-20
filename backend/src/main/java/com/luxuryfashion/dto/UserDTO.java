package com.luxuryfashion.dto;

import lombok.Builder;
import lombok.Data;

import java.util.Set;

@Data
@Builder
public class UserDTO {
    private Long id;
    private String email;
    private String fullName;
    private String phone; // new
    private String address; // new
    private Set<String> roles;
}
