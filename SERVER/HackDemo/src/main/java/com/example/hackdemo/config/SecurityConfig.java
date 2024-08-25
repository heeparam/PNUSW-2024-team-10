package com.example.hackdemo.config;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(authorize -> authorize
                        .requestMatchers("/api/course/{id}/favorite").authenticated()
                        .requestMatchers("/api/course/favorites").authenticated()
                        .requestMatchers("/api/restaurant/{id}/favorite").authenticated()
                        .requestMatchers("/api/restaurant/favorites").authenticated()
                        .requestMatchers("/api/tourSpot/{id}/favorite").authenticated()
                        .requestMatchers("/api/tourSpot/favorites").authenticated()
                        .requestMatchers("/api/user/{userId}/favorites").authenticated()
                        .requestMatchers("/api/auth/google").permitAll()
                        .anyRequest().permitAll()
                )
                .oauth2Login(oauth2 -> oauth2
                        .defaultSuccessUrl("/api/auth/login-success", true)
                        .permitAll()
                )
                .logout(logout -> logout
                        .logoutSuccessUrl("/api/auth/logout-success") // 로그아웃 후 리디렉션될 엔드포인트
                        .permitAll()
                )
                .csrf(csrf -> csrf.disable());

        return http.build();
    }
}
