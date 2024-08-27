package br.gov.serpro.dedat.rescar.acesso.application;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import br.gov.serpro.dedat.rescar.acesso.application.command.AlterarDadosPessoaisCommand;
import br.gov.serpro.dedat.rescar.acesso.application.command.AlterarEnderecoUsuarioCommand;
import br.gov.serpro.dedat.rescar.acesso.application.command.AlterarPerfilUsuarioCommand;
import br.gov.serpro.dedat.rescar.acesso.application.command.AlterarSituacaoUsuarioCommand;
import br.gov.serpro.dedat.rescar.acesso.application.command.IncluirEnderecoUsuarioCommand;
import br.gov.serpro.dedat.rescar.acesso.application.command.IncluirUsuarioCommand;
import br.gov.serpro.dedat.rescar.acesso.application.command.RegistrarUsuarioCommand;
import br.gov.serpro.dedat.rescar.acesso.application.query.ListarUsuarioPorPerfilQuery;
import br.gov.serpro.dedat.rescar.acesso.application.representation.UsuarioRepresentation;
import br.gov.serpro.dedat.rescar.acesso.application.validation.AlterarDadosPessoaisValidation;
import br.gov.serpro.dedat.rescar.acesso.application.validation.IncluirUsuarioValidation;
import br.gov.serpro.dedat.rescar.acesso.application.validation.ObterUsuarioValidation;
import br.gov.serpro.dedat.rescar.acesso.application.validation.RegistrarUsuarioValidation;
import br.gov.serpro.dedat.rescar.acesso.domain.ObjetoExistente;
import br.gov.serpro.dedat.rescar.acesso.domain.seguranca.Criptografia;
import br.gov.serpro.dedat.rescar.acesso.domain.seguranca.Seguranca;
import br.gov.serpro.dedat.rescar.acesso.domain.usuario.Endereco;
import br.gov.serpro.dedat.rescar.acesso.domain.usuario.Perfil;
import br.gov.serpro.dedat.rescar.acesso.domain.usuario.SenhaCriptografada;
import br.gov.serpro.dedat.rescar.acesso.domain.usuario.SituacaoUsuario;
import br.gov.serpro.dedat.rescar.acesso.domain.usuario.Usuario;
import br.gov.serpro.dedat.rescar.acesso.domain.usuario.repository.UsuarioRepository;
import br.gov.serpro.dedat.rescar.acesso.infrastructure.validation.Validacao;

@Service
public class ManterUsuarioService {

	private UsuarioRepository usuarioRepository;
	private Seguranca seguranca;
	private Criptografia criptografia;
	private CepService cepService;

	public ManterUsuarioService(UsuarioRepository usuarioRepository, Seguranca seguranca, CepService cepService, Criptografia criptografia) {
		super();
		this.usuarioRepository = usuarioRepository;
		this.seguranca = seguranca;
		this.criptografia = criptografia;
		this.cepService = cepService;
	}

	@Transactional
	public UsuarioRepresentation registrar(RegistrarUsuarioCommand command) {
		Validacao.notNull(command);

		new RegistrarUsuarioValidation(this.usuarioRepository).validate(command);

		Endereco endereco = null;

		if (command.getEndereco() != null) {
			endereco = new Endereco(command.getEndereco().getCep(), command.getEndereco().getLogradouro(),
					command.getEndereco().getNumero(), command.getEndereco().getComplemento(),
					command.getEndereco().getBairro(), command.getEndereco().getLocalidade(),
					command.getEndereco().getUf(), null);
		}

		Usuario usuario = new Usuario(command.getEmail(), new SenhaCriptografada(command.getSenha(), this.criptografia),
				command.getNome(), Perfil.toEnum(command.getPerfil()), endereco);
		usuario.alterarSituacao(SituacaoUsuario.INATIVO);

		this.usuarioRepository.add(usuario);

		return new UsuarioRepresentation(usuario);
	}

	@Transactional
	public UsuarioRepresentation incluir(IncluirUsuarioCommand command) {
		Validacao.notNull(command);

		new IncluirUsuarioValidation(this.usuarioRepository).validate(command);

		Endereco endereco = null;

		if (command.getEndereco() != null) {
			
			cepService.complementaEndereco(command.getEndereco());
			
			endereco = new Endereco(command.getEndereco().getCep(), command.getEndereco().getLogradouro(),
					command.getEndereco().getNumero(), command.getEndereco().getComplemento(),
					command.getEndereco().getBairro(), command.getEndereco().getLocalidade(),
					command.getEndereco().getUf(), null);
		}

		Usuario usuario = new Usuario(command.getEmail(), new SenhaCriptografada(command.getSenha(), this.criptografia),
				command.getNome(), Perfil.toEnum(command.getPerfil()), endereco);

		this.usuarioRepository.add(usuario);

		return new UsuarioRepresentation(usuario);
	}

	@Transactional
	public void alterarDadosPessoais(AlterarDadosPessoaisCommand command) {
		Validacao.notNull(command);

		Usuario usuarioCadastrado = this.usuarioRepository.get(command.getId());

		new AlterarDadosPessoaisValidation(this.usuarioRepository, this.seguranca, usuarioCadastrado).validate(command);

		usuarioCadastrado.alterarDadosPessoais(command.getEmail(),
				new SenhaCriptografada(command.getSenha(), this.criptografia), command.getNome());
	}

	@Transactional
	public void alterarPerfil(AlterarPerfilUsuarioCommand command) {
		Validacao.notNull(command);

		Usuario usuarioCadastrado = this.usuarioRepository.get(command.getId());

		new ObjetoExistente().validate(usuarioCadastrado);

		usuarioCadastrado.alterarPerfil(Perfil.toEnum(command.getPerfil()));
	}

	@Transactional
	public void alterarSituacao(AlterarSituacaoUsuarioCommand command) {
		Validacao.notNull(command);

		Usuario usuarioCadastrado = this.usuarioRepository.get(command.getId());

		new ObjetoExistente().validate(usuarioCadastrado);

		usuarioCadastrado.alterarSituacao(SituacaoUsuario.toEnum(command.getSituacao()));
	}
	
	@Transactional
	public void incluirEndereco(IncluirEnderecoUsuarioCommand command) {
		Validacao.notNull(command);
		Validacao.notNull(command.getEndereco());

		Usuario usuarioCadastrado = this.usuarioRepository.get(command.getId());

		new ObjetoExistente().validate(usuarioCadastrado);
		
		cepService.complementaEndereco(command.getEndereco());

		Endereco endereco = new Endereco(command.getEndereco().getCep(), command.getEndereco().getLogradouro(),
					command.getEndereco().getNumero(), command.getEndereco().getComplemento(),
					command.getEndereco().getBairro(), command.getEndereco().getLocalidade(),
					command.getEndereco().getUf(), usuarioCadastrado);

		usuarioCadastrado.alterarEndereco(endereco);

	}

	@Transactional
	public void alterarEndereco(AlterarEnderecoUsuarioCommand command) {
		Validacao.notNull(command);
		Validacao.notNull(command.getEndereco());

		Usuario usuarioCadastrado = this.usuarioRepository.get(command.getId());

		new ObjetoExistente().validate(usuarioCadastrado);
		new ObjetoExistente().validate(usuarioCadastrado.getEndereco());
		
		cepService.complementaEndereco(command.getEndereco());

		Endereco endereco = usuarioCadastrado.getEndereco();

		endereco.alterarDadosEndereco(command.getEndereco().getCep(), command.getEndereco().getLogradouro(),
				command.getEndereco().getNumero(), command.getEndereco().getComplemento(),
				command.getEndereco().getBairro(), command.getEndereco().getLocalidade(),
				command.getEndereco().getUf());
		
		usuarioCadastrado.alterarEndereco(endereco);
	}
	
	@Transactional
	public void removerEndereco(UUID id) {
		Validacao.notNull(id);

		Usuario usuarioCadastrado = this.usuarioRepository.get(id);

		new ObjetoExistente().validate(usuarioCadastrado);
		new ObjetoExistente().validate(usuarioCadastrado.getEndereco());

		usuarioCadastrado.removerEndereco();
	}

	public UsuarioRepresentation obter(UUID id) {
		Validacao.notNull(id);

		Usuario usuarioCadastrado = this.usuarioRepository.get(id);

		new ObterUsuarioValidation(this.seguranca).validate(usuarioCadastrado);

		return new UsuarioRepresentation(usuarioCadastrado);
	}

	public List<UsuarioRepresentation> listarPorPerfil(ListarUsuarioPorPerfilQuery query) {
		Validacao.notNull(query);

		List<UsuarioRepresentation> lista = new ArrayList<>();

		this.usuarioRepository.findByPerfil(Perfil.toEnum(query.getPerfil())).stream()
				.forEach(usuario -> lista.add(new UsuarioRepresentation(usuario)));

		return lista;
	}

	public List<UsuarioRepresentation> listar() {
		List<UsuarioRepresentation> lista = new ArrayList<>();

		this.usuarioRepository.all().stream().forEach(usuario -> lista.add(new UsuarioRepresentation(usuario)));

		return lista;
	}
}
