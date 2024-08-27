package br.gov.serpro.dedat.rescar.acesso.infrastructure.ws.rest.swagger;

import java.util.List;

import org.springdoc.core.customizers.OpenApiCustomiser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import io.swagger.v3.oas.annotations.ExternalDocumentation;
import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.enums.SecuritySchemeType;
import io.swagger.v3.oas.annotations.info.Contact;
import io.swagger.v3.oas.annotations.info.Info;
import io.swagger.v3.oas.annotations.security.SecurityScheme;
import io.swagger.v3.oas.models.servers.Server;

@OpenAPIDefinition(
    info = @Info(
        title = "RESCAR - Acesso",
        version = "Versão 1.0",
        description = "API de serviços",
        contact = @Contact(name = "rodrigo.wisnievski@serpro.gov.br")),
    externalDocs = @ExternalDocumentation(
        description = "Arquitetura de Referência Backend (DDD+Hexagonal)",
        url = "https://dedat.gitpages.serpro/deat9/arquitetura-referencia-backend-ddd/"))
@SecurityScheme(name = "Authorization", type = SecuritySchemeType.HTTP, scheme = "bearer", bearerFormat = "jwt")
@Configuration
public class Swagger3Config {
	
	@Value("${SWAGGER_PATH:}") 
	private String path;
	
	@Value("${SWAGGER_SERVER_URL:}") 
	private String serverUrl;
	
	@Bean
	public OpenApiCustomiser openApiCustomiser() {
	    return openApi -> openApi
	        .servers(List.of(
	                new Server()
	                        .url(serverUrl!= null && !serverUrl.isBlank() ? serverUrl+path : openApi.getServers().get(0).getUrl()+path)
	                        .description(path != null && !path.isBlank() ? "" : openApi.getServers().get(0).getDescription())
//	                        .url(openApi.getServers().get(0).getUrl().contains(".estaleiro") ? openApi.getServers().get(0).getUrl()+"/api" : openApi.getServers().get(0).getUrl())
//	                        .description(openApi.getServers().get(0).getUrl().contains(".estaleiro") ? "Estaleiro" : openApi.getServers().get(0).getDescription())
	        		)	);
	}
	
}