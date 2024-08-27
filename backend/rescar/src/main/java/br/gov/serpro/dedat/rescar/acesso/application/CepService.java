package br.gov.serpro.dedat.rescar.acesso.application;

import org.springframework.stereotype.Service;

import br.gov.serpro.dedat.rescar.acesso.application.command.AbstractEnderecoCommand;
import br.gov.serpro.dedat.rescar.acesso.application.representation.EnderecoRepresentation;
import br.gov.serpro.dedat.rescar.acesso.infrastructure.client.rest.CepClient;

@Service
public class CepService {

	private CepClient cepClient;
	
	public CepService(CepClient cepClient) {
		this.cepClient = cepClient;
	}
	
	public EnderecoRepresentation getEndereco(String cep) {
		EnderecoRepresentation endereco = new EnderecoRepresentation(cepClient.getEndereco(cep));
		return endereco;
	}
	
	public void complementaEndereco(AbstractEnderecoCommand command) {
		
		try {
			
			if(command != null && command.getCep() != null) {
				
				EnderecoRepresentation endereco = this.getEndereco(command.getCep());
				
				if(endereco != null) {
					if(command.getLogradouro() == null || command.getLogradouro().trim().isEmpty()) {
						command.setLogradouro(endereco.getLogradouro());
					}
					if(command.getComplemento() == null || command.getComplemento().trim().isEmpty()) {
						command.setComplemento(endereco.getComplemento());
					}
					if(command.getNumero() == null || command.getNumero().trim().isEmpty()) {
						command.setNumero(endereco.getNumero());
					}
					if(command.getBairro() == null || command.getBairro().trim().isEmpty()) {
						command.setBairro(endereco.getBairro());
					}
					if(command.getLocalidade() == null || command.getLocalidade().trim().isEmpty()) {
						command.setLocalidade(endereco.getLocalidade());
					}
					if(command.getUf() == null || command.getUf().trim().isEmpty()) {
						command.setUf(endereco.getUf());
					}
				}
			}
			
		} catch (Exception e) {
			System.err.println(e);
		}

	}

	
}
