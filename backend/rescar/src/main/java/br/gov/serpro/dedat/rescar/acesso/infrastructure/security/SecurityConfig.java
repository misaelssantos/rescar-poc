package br.gov.serpro.dedat.rescar.acesso.infrastructure.security;

import java.util.Arrays;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.core.GrantedAuthorityDefaults;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import br.gov.serpro.dedat.rescar.acesso.infrastructure.security.jwt.JWTAuthenticationFilter;
import br.gov.serpro.dedat.rescar.acesso.infrastructure.security.jwt.JWTAuthorizationFilter;
import br.gov.serpro.dedat.rescar.acesso.infrastructure.security.jwt.SegurancaJWT;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig {

    private RescarAuthenticationProvider authProvider;
    private SegurancaJWT seguranca;

    private static final String[] PUBLIC_MATCHERS = {"/h2-console/**", "/v3/api-docs/**", "/swagger-ui.html", "/swagger-resources/**", "/swagger-ui/**", "/v1/usuarios/registro" };

    public SecurityConfig(RescarAuthenticationProvider authProvider, SegurancaJWT seguranca) {
        this.authProvider = authProvider;
        this.seguranca = seguranca;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        AuthenticationManagerBuilder authenticationManagerBuilder = http.getSharedObject(AuthenticationManagerBuilder.class);
        authenticationManagerBuilder.authenticationProvider(this.authProvider);
        AuthenticationManager authenticationManager = authenticationManagerBuilder.build();

        http.headers().frameOptions().disable();
        http.cors().and().csrf().disable();
        http.authorizeRequests().anyRequest().authenticated();
        http.authenticationManager(authenticationManager);
        http.addFilter(new JWTAuthenticationFilter(authenticationManager));
        http.addFilterBefore(new JWTAuthorizationFilter(this.seguranca), UsernamePasswordAuthenticationFilter.class);
        http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);

        return http.build();
    }

    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return (web) -> web.ignoring().antMatchers(PUBLIC_MATCHERS);
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration().applyPermitDefaultValues();
        configuration.setAllowedMethods(Arrays.asList("POST", "GET", "PUT", "DELETE", "OPTIONS"));

        final UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);

        return source;
    }

    @Bean
    public GrantedAuthorityDefaults grantedAuthorityDefaults() {
        return new GrantedAuthorityDefaults("");
    }
}