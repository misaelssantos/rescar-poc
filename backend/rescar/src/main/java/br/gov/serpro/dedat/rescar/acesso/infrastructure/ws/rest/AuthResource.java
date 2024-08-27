package br.gov.serpro.dedat.rescar.acesso.infrastructure.ws.rest;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.gov.serpro.dedat.rescar.acesso.application.EfetuarLoginService;
import br.gov.serpro.dedat.rescar.acesso.application.command.EfetuarLoginCommand;
import br.gov.serpro.dedat.rescar.acesso.domain.seguranca.Credenciais;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;

@RestController
@RequestMapping(value = "/")
public class AuthResource {

    private EfetuarLoginService service;

    public AuthResource(EfetuarLoginService service) {
        this.service = service;
    }

    @SecurityRequirement(name = "Authorization")
    @GetMapping(value = "/auth/refresh_token")
    public ResponseEntity<Void> refreshToken(HttpServletResponse response) {
        Credenciais credendicais = this.service.renovarCredenciais();

        response.addHeader("Authorization", "Bearer " + credendicais);
        response.addHeader("Access-Control-Expose-Headers", "Authorization");

        return ResponseEntity.noContent().build();
    }
    
    @PostMapping("/login")
    public void fakeLogin(@Valid @RequestBody EfetuarLoginCommand efetuarLoginCommand) {
        throw new IllegalStateException("This method shouldn't be called. It's implemented by Spring Security filters.");
    }

}