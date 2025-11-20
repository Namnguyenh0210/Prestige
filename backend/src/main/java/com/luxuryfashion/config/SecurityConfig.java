package com.luxuryfashion.config;

import com.luxuryfashion.security.JwtAuthenticationFilter;
import com.luxuryfashion.security.JwtService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfigurationSource;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
@RequiredArgsConstructor
public class SecurityConfig {

    private final JwtAuthenticationFilter jwtAuthFilter;
    private final UserDetailsService userDetailsService;
    private final CorsConfigurationSource corsConfigurationSource;
    private final JwtService jwtService;   // <-- THÊM VÀO ĐỂ TẠO JWT

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

        http
                .csrf(AbstractHttpConfigurer::disable)
                .cors(cors -> cors.configurationSource(corsConfigurationSource))
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers(
                                "/auth/**", "/api/auth/**",
                                "/products/**", "/api/products/**",
                                "/public/**", "/api/public/**",
                                "/v3/api-docs/**", "/swagger-ui/**", "/swagger-ui.html"
                        ).permitAll()

                        .requestMatchers("/admin/**", "/api/admin/**").hasRole("ADMIN")
                        .requestMatchers("/staff/**", "/api/staff/**").hasAnyRole("ADMIN", "NHANVIEN")
                        .anyRequest().authenticated()
                )
                .sessionManagement(session ->
                        session.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                )
                .authenticationProvider(authenticationProvider())
                .addFilterBefore(jwtAuthFilter, UsernamePasswordAuthenticationFilter.class);


        // ============================== OAUTH2 LOGIN ==============================
        http.oauth2Login(oauth -> {
            oauth.permitAll();

            oauth.successHandler((request, response, authentication) -> {

                DefaultOAuth2User oauthUser = (DefaultOAuth2User) authentication.getPrincipal();
                String email = oauthUser.getAttribute("email");

                // Tạo userDetails tạm
                UserDetails newUser = org.springframework.security.core.userdetails.User
                        .withUsername(email)
                        .password("{noop}")
                        .roles("OAUTH_USER")
                        .build();

                // Cập nhật Context
                Authentication newAuth = new UsernamePasswordAuthenticationToken(
                        newUser,
                        null,
                        newUser.getAuthorities()
                );
                SecurityContextHolder.getContext().setAuthentication(newAuth);

                // ======== TẠO JWT TỪ JwtService =========
                String token = jwtService.generateToken(newUser);

                // Redirect về front-end
                final String FRONTEND = "http://localhost:5173/";
                response.sendRedirect(FRONTEND + "?token=" + token);
            });
        });

        return http.build();
    }

    @Bean
    public AuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(userDetailsService);
        provider.setPasswordEncoder(passwordEncoder());
        return provider;
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration config)
            throws Exception {
        return config.getAuthenticationManager();
    }

    @Bean
    @SuppressWarnings("deprecation")
    public PasswordEncoder passwordEncoder() {
        return NoOpPasswordEncoder.getInstance();
    }
}
