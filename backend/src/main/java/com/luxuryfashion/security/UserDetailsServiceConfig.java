package com.luxuryfashion.security;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

/**
 * UserDetailsService tam thoi - Su dung InMemory
 * Team Leader se thay the bang UserDetailsService that su dung database
 */
@Configuration
public class UserDetailsServiceConfig {

    @Bean
    public UserDetailsService userDetailsService() {
        // Tao 1 user tam de test (Team Leader se thay the sau)
        UserDetails adminUser = User.builder()
                .username("admin@luxuryfashion.com")
                .password("$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Rogg.8K/6cNHtVUXzl64.VsG") // password = "password"
                .roles("ADMIN")
                .build();

        return new InMemoryUserDetailsManager(adminUser);
    }
}

