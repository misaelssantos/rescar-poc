package br.gov.serpro.dedat.rescar.acesso.infrastructure.security.jwt;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import br.gov.serpro.dedat.rescar.acesso.application.command.EfetuarLoginCommand;
import br.gov.serpro.dedat.rescar.acesso.infrastructure.ws.rest.exceptionhandler.StandardError;

public class JWTAuthenticationFilter extends UsernamePasswordAuthenticationFilter {

    private AuthenticationManager authenticationManager;

    public JWTAuthenticationFilter(AuthenticationManager authenticationManager) {
        this.authenticationManager = authenticationManager;
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest req, HttpServletResponse res) {
        try {
            EfetuarLoginCommand command = new ObjectMapper().readValue(req.getInputStream(), EfetuarLoginCommand.class);

            UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(command.getEmail(),
                command.getSenha(), new ArrayList<>());

            return this.authenticationManager.authenticate(authToken);
        } catch (Exception e) {
            throw new BadCredentialsException(e.getMessage(), e);
        }
    }

    @Override
    protected void successfulAuthentication(HttpServletRequest req, HttpServletResponse res, FilterChain chain,
        Authentication auth) throws IOException, ServletException {

        res.addHeader("Authorization", "Bearer " + ((CredenciaisJWT) auth.getPrincipal()).toString());
        res.addHeader("access-control-expose-headers", "Authorization");
    }

    @Override
    protected void unsuccessfulAuthentication(HttpServletRequest req, HttpServletResponse res, AuthenticationException failed)
        throws IOException, ServletException {
        Gson gson = new Gson();

        String json = gson.toJson(new StandardError(HttpStatus.UNAUTHORIZED.value(), failed.getMessage(), req.getRequestURI()));

        res.setStatus(401);
        res.setContentType("application/json");
        res.getWriter().append(json);
    }
}