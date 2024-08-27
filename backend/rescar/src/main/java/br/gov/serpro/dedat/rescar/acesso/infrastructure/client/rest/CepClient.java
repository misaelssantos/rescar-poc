package br.gov.serpro.dedat.rescar.acesso.infrastructure.client.rest;

import static java.util.logging.Logger.getLogger;	

import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.http.HttpHost;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import br.gov.serpro.dedat.rescar.acesso.infrastructure.client.rest.representation.EnderecoClientRepresentation;
import br.gov.serpro.dedat.rescar.acesso.infrastructure.exception.RescarSecurityException;
import br.gov.serpro.dedat.rescar.acesso.infrastructure.internacionalization.Mensagens;
import br.gov.serpro.dedat.rescar.acesso.infrastructure.validation.Validacao;

@Service
public class CepClient {
	
	private static final Logger LOG = getLogger(CepClient.class.getName());
	
    private Boolean proxyHabilitado;
    private String proxyUrl;
    private String proxyUsername;
    private String proxyPassword;
    private Integer proxyPorta;
    private String urlApiCep;

    public CepClient(
	        @Value("${proxy_autenticado_habilitado:false}") Boolean proxyHabilitado,
	        @Value("${proxy_autenticado_url:}") String proxyUrl,
	        @Value("${proxy_autenticado_usuario:}") String proxyUsername,
	        @Value("${proxy_autenticado_senha:}") String proxyPassword,
	        @Value("${proxy_autenticado_porta:}") Integer proxyPorta,
            @Value("${URL_API_CEP:https://viacep.com.br/ws/%s/json}") String urlApiCep
        ) {
        this.proxyHabilitado = proxyHabilitado;
        this.proxyUrl = proxyUrl;
        this.proxyUsername = proxyUsername;
        this.proxyPassword = proxyPassword;
        this.proxyPorta = proxyPorta;
        this.urlApiCep = urlApiCep;
    }

	public EnderecoClientRepresentation getEndereco(String cep) {
		Validacao.notBlank(cep);
		Validacao.size(cep, 8, 8);
		Validacao.onlyDigits(cep);
		
		EnderecoClientRepresentation endereco = null;
		
		try {
		
			RestTemplate restTemplate = createRestTemplate();
			
	//		endereco = restTemplate.getForObject("https://opencep.com/v1/"+cep, EnderecoClientRepresentation.class);
			endereco = restTemplate.getForObject(String.format(urlApiCep, cep), EnderecoClientRepresentation.class);
			
			System.out.println(endereco);
			
			if(endereco.getErro() != null && endereco.getErro()) {
				return null;
			}
		
        } catch (Exception e) {
            LOG.log(Level.SEVERE, e.getMessage(), e);
            throw new RescarSecurityException(Mensagens.get("erro-busca-cep"));
        }
		
		return endereco;
	}
	
    private RestTemplate createRestTemplate() throws Exception {
    	
    	if(this.proxyHabilitado) {
    		
            CredentialsProvider credsProvider = new BasicCredentialsProvider();
            credsProvider.setCredentials( 
                new AuthScope(this.proxyUrl, this.proxyPorta), 
                new UsernamePasswordCredentials(this.proxyUsername, this.proxyPassword)
            );

            HttpHost myProxy = new HttpHost(this.proxyUrl, this.proxyPorta);
            HttpClientBuilder clientBuilder = HttpClientBuilder.create();

            clientBuilder.setProxy(myProxy).setDefaultCredentialsProvider(credsProvider).disableCookieManagement();

            HttpClient httpClient = clientBuilder.build();
            HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
            factory.setHttpClient(httpClient);

            return new RestTemplate(factory);

    	} else {
    		
    		return new RestTemplate();
    		
    	}
    	
    }
	
}
