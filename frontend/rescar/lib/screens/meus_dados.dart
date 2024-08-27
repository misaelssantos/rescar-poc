import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:govbr_ds/components/br_button.dart';
import 'package:govbr_ds/components/br_card.dart';
import 'package:govbr_ds/components/br_footer.dart';
import 'package:govbr_ds/components/br_grid.dart';
import 'package:govbr_ds/components/br_header.dart';
import 'package:govbr_ds/components/br_input.dart';
import 'package:govbr_ds/components/br_loading.dart';
import 'package:govbr_ds/components/br_menu.dart';
import 'package:govbr_ds/components/br_password.dart';
import 'package:govbr_ds/components/br_select.dart';
import 'package:govbr_ds/theme/theme_colors.dart';
import 'package:govbr_ds/utils/responsive.dart';
import 'package:provider/provider.dart';
import 'package:rescar/components/rescar_footer.dart';
import 'package:rescar/components/rescar_menu.dart';
import 'package:rescar/models/credentials.dart';
import 'package:rescar/models/usuario.dart';
import 'package:rescar/services/cep/cep_service.dart';
import 'package:rescar/services/usuarios/usuarios_service.dart';
import 'package:rescar/utils/alert_util.dart';
import 'package:rescar/utils/future_util.dart';

class MeusDadosScreen extends StatefulWidget {
  const MeusDadosScreen({super.key});

  @override
  State<MeusDadosScreen> createState() => _MeusDadosScreenState();
}

class _MeusDadosScreenState extends State<MeusDadosScreen> {
  late UsuariosService _usuariosService;
  late Future<Usuario> _usuario;
  late InfoUsuario? _usuarioLogado;
  late String? _ufSelected;
  final TextEditingController _controllerUF = TextEditingController();
  final Map<String, String> estados = {
    "AC": "Acre",
    "AL": "Alagoas",
    "AP": "Amapá",
    "AM": "Amazonas",
    "BA": "Bahia",
    "CE": "Ceará",
    "DF": "Distrito Federal",
    "ES": "Espírito Santo",
    "GO": "Goiás",
    "MA": "Maranhão",
    "MT": "Mato Grosso",
    "MS": "Mato Grosso do Sul",
    "MG": "Minas Gerais",
    "PR": "Paraná",
    "PB": "Paraíba",
    "PA": "Pará",
    "PE": "Pernambuco",
    "PI": "Piauí",
    "RN": "Rio Grande do Norte",
    "RS": "Rio Grande do Sul",
    "RJ": "Rio de Janeiro",
    "RO": "Rondônia",
    "RR": "Roraima",
    "SC": "Santa Catarina",
    "SE": "Sergipe",
    "SP": "São Paulo",
    "TO": "Tocantins"
  };

  final _formDadosBasicosKey = GlobalKey<FormState>();
  final _emailFieldKey = GlobalKey<FormFieldState<String>>(debugLabel: "email");
  final _nomeFieldKey = GlobalKey<FormFieldState<String>>(debugLabel: "nome");
  final _senhaFieldKey = GlobalKey<FormFieldState<String>>(debugLabel: "senha");

  final _formEnderecoKey = GlobalKey<FormState>();
  final _cepFieldKey = GlobalKey<FormFieldState<String>>(debugLabel: "cep");
  final _logradouroFieldKey =
      GlobalKey<FormFieldState<String>>(debugLabel: "logradouro");
  final _complementoFieldKey =
      GlobalKey<FormFieldState<String>>(debugLabel: "complemento");
  final _numeroFieldKey =
      GlobalKey<FormFieldState<String>>(debugLabel: "numero");
  final _bairroFieldKey =
      GlobalKey<FormFieldState<String>>(debugLabel: "bairro");
  final _localidadeFieldKey =
      GlobalKey<FormFieldState<String>>(debugLabel: "localidade");
  final _ufFieldKey = GlobalKey<FormFieldState<String>>(debugLabel: "uf");



  @override
  void initState() {
    super.initState();
    _usuariosService = Provider.of<UsuariosService>(context, listen: false);
    _usuarioLogado = Provider.of<InfoUsuario?>(context,
        listen: false); //TODO se usar listen , precisa colocar no método build!
    if (_usuarioLogado != null) {
      _refreshDadosUsuario(_usuarioLogado);
    }
  }

  Future<void> _refreshDadosUsuario(usuarioLogado) async {
    setState(() {
      _usuario = FutureUtil.withError(
          context,
          _usuariosService
              .get(usuarioLogado.id)); //, (usuario) => Future.value(usuario)
      _usuario.then((value) => _ufSelected = value.endereco?.uf);
    });
  }

  _salvarDadosBasicos(Usuario usuario) async {
    if (_formDadosBasicosKey.currentState!.validate()) {
      String email = _emailFieldKey.currentState!.value!.replaceAll('\t', '');
      String nome = _nomeFieldKey.currentState!.value!.replaceAll('\t', '');
      String senha = _senhaFieldKey.currentState!.value!.replaceAll('\t', '');

      await FutureUtil.withOverlayAndError(
          context,
          _usuariosService.atualizarDadosBasicos(
            usuario.id!,
            DadosBasicos(nome: nome, email: email, senha: senha),
          ), (resposta) async {
        _refreshDadosUsuario(usuario);
        AlertUtil.success(
            context, "Dados Básicos alterados com sucesso!", false);
        return resposta;
      });
    } else {
      AlertUtil.error(context, "Formulário Dados Básicos inválido!");
    }
  }

  _salvarEndereco(Usuario usuario) async {
    if (_formEnderecoKey.currentState!.validate()) {
      String? cep = _cepFieldKey.currentState!.value;
      String? logradouro = _logradouroFieldKey.currentState!.value;
      String? complemento = _complementoFieldKey.currentState!.value;
      String? numero = _numeroFieldKey.currentState!.value;
      String? bairro = _bairroFieldKey.currentState!.value;
      String? localidade = _localidadeFieldKey.currentState!.value;
      String? uf = _ufSelected;//_ufFieldKey.currentState!.value;

      if (usuario.endereco != null && usuario.endereco!.id != null) {
        Endereco endereco = Endereco(
            id: usuario.endereco!.id,
            cep: cep,
            logradouro: logradouro,
            complemento: complemento,
            numero: numero,
            bairro: bairro,
            localidade: localidade,
            uf: uf);
        await FutureUtil.withOverlayAndError(
            context,
            _usuariosService.atualizarEndereco(
                usuario.id!, usuario.copyWith(endereco: endereco)),
            (resposta) async {
          _refreshDadosUsuario(usuario);
          AlertUtil.success(context, "Endereço alterado com sucesso!", false);
          return resposta;
        });
      } else {
        Endereco endereco = Endereco(
            cep: cep,
            logradouro: logradouro,
            complemento: complemento,
            numero: numero,
            bairro: bairro,
            localidade: localidade,
            uf: uf);
        await FutureUtil.withOverlayAndError(
            context,
            _usuariosService.atualizarEndereco(
                usuario.id!, usuario.copyWith(endereco: endereco)),
            (resposta) async {
          _refreshDadosUsuario(usuario);
          AlertUtil.success(context, "Endereço incluído com sucesso!", false);
          return resposta;
        });
      }
    } else {
      AlertUtil.error(context, "Formulário Endereço inválido!");
    }
  }

  _apagarEndereco(Usuario usuario) async {
    if (usuario.endereco != null && usuario.endereco!.id != null) {
      await FutureUtil.withOverlayAndError(
          context, _usuariosService.removerEndereco(usuario.id!),
          (resposta) async {
        _refreshDadosUsuario(usuario);
        _controllerUF.text = "";
        AlertUtil.success(context, "Endereço apagado com sucesso!", false);
        return resposta;
      });
    }
  }

  _buscarCep(Usuario usuario) async {
    if (_cepFieldKey.currentState!.isValid) {
      String cep = _cepFieldKey.currentState!.value!.replaceAll('\t', '');

      await FutureUtil.withOverlayAndError(
          context, Provider.of<CepService>(context, listen: false).get(cep),
          (endereco) async {
        if (usuario.endereco != null && usuario.endereco!.id != null) {
          endereco = endereco.copyWith(id: usuario.endereco!.id);
        }

        setState(() {
          _cepFieldKey.currentState!
              .didChange(endereco.cep?.replaceAll("-", ""));
          _complementoFieldKey.currentState!.didChange(endereco.complemento);
          _numeroFieldKey.currentState!.didChange(endereco.numero);
          _bairroFieldKey.currentState!.didChange(endereco.bairro);
          _localidadeFieldKey.currentState!.didChange(endereco.localidade);
          // _ufFieldKey.currentState!.didChange(endereco.uf);
          // _controllerUF.text = endereco.uf ?? "";
          _ufSelected = endereco.uf;
          _controllerUF.text = estados[endereco.uf] ?? "";
          _logradouroFieldKey.currentState!.didChange(endereco.logradouro);
        });
        return endereco;
      });
    }
  }

  // String _formataPerfil(String perfil) {
  //   switch (perfil) {
  //     case "A":
  //       return "Administrador";
  //     case "M":
  //       return "Motorista";
  //     case "C":
  //       return "Colaborador";
  //     default:
  //       return perfil;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BrHeader(title: "Meus Dados", assinatura: "Rescar"),
      drawer: RescarMenu(usuarioLogado: _usuarioLogado),
      bottomNavigationBar: const RescarFooter(),
      body: SingleChildScrollView(
        child: FutureBuilder<Usuario>(
          future: _usuario,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: BrLoading());
            }
            Usuario? usuario = snapshot.data ?? Usuario();
            return BrGrid(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: <BrResponsiveItem>[
                BrResponsiveItem(
                    xs: 12,
                    md: 6,
                    xl: 4,
                    child: Form(
                        key: _formDadosBasicosKey,
                        child: BrCard(
                            header: const Text("Dados Básicos"),
                            content: Column(children: [
                              BrInput(
                                inputKey: _emailFieldKey,
                                label: "Email",
                                initialValue: usuario.email,
                                validator: (value) =>
                                    (value == null || value.isEmpty)
                                        ? "Campo obrigatório"
                                        : null,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              BrInput(
                                inputKey: _nomeFieldKey,
                                label: "Nome",
                                initialValue: usuario.nome,
                                validator: (value) =>
                                    (value == null || value.isEmpty)
                                        ? "Campo obrigatório"
                                        : null,
                              ),
                              BrPassword(
                                inputKey: _senhaFieldKey,
                                label: "Senha",
                                initialValue: usuario.senha,
                                validator: (value) =>
                                    (value == null || value.isEmpty)
                                        ? "Campo obrigatório"
                                        : null,
                              ),
                              BrSelect(
                                  label: "Perfil",
                                  initialValue: usuario.perfil,
                                  enabled: false,
                                  items: const [
                                    DropdownMenuEntry(
                                        value: "A", label: "Administrador"),
                                    DropdownMenuEntry(
                                        value: "M", label: "Motorista"),
                                    DropdownMenuEntry(
                                        value: "C", label: "Colaborador")
                                  ]),
                            ]),
                            footer: BrGrid(
                                margin: 0,
                                gutter: 8,
                                runSpacing: 8,
                                children: [
                                  const BrResponsiveItem(
                                    xs: 0,
                                    sm: 6,
                                    md: 4,
                                    lg: 6,
                                    child: SizedBox.shrink(),
                                  ),
                                  BrResponsiveItem(
                                      xs: 12,
                                      sm: 6,
                                      md: 8,
                                      lg: 6,
                                      child: BrButton(
                                          text: "Salvar Dados Básicos",
                                          onPressed: () =>
                                              _salvarDadosBasicos(usuario)))
                                ])))),
                BrResponsiveItem(
                    xs: 12,
                    md: 6,
                    xl: 4,
                    child: Form(
                        key: _formEnderecoKey,
                        child: BrCard(
                            header: const Text("Endereço"),
                            content: Column(children: [
                              BrInput(
                                label: "Cep",
                                inputKey: _cepFieldKey,
                                initialValue: usuario.endereco?.cep ?? "",
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                                validator: (value) =>
                                    (value == null || value.isEmpty)
                                        ? "Campo obrigatório"
                                        : value.length != 8
                                            ? "Deve conter 8 dígitos"
                                            : null,
                                suffixIcons: [
                                  IconButton(
                                    color: Theme.of(context).iconTheme.color,
                                    icon: const FaIcon(
                                      FontAwesomeIcons.magnifyingGlass,
                                    ),
                                    onPressed: () {
                                      _buscarCep(usuario);
                                    },
                                  ),
                                ],
                              ),
                              BrInput(
                                label: "Logradouro",
                                inputKey: _logradouroFieldKey,
                                initialValue:
                                    usuario.endereco?.logradouro ?? "",
                              ),
                              BrInput(
                                label: "Complemento",
                                inputKey: _complementoFieldKey,
                                initialValue:
                                    usuario.endereco?.complemento ?? "",
                              ),
                              BrInput(
                                label: "Número",
                                inputKey: _numeroFieldKey,
                                initialValue: usuario.endereco?.numero ?? "",
                              ),
                              BrInput(
                                label: "Bairro",
                                inputKey: _bairroFieldKey,
                                initialValue: usuario.endereco?.bairro ?? "",
                              ),
                              BrInput(
                                label: "Localidade",
                                inputKey: _localidadeFieldKey,
                                initialValue:
                                    usuario.endereco?.localidade ?? "",
                              ),
                              BrSelect(
                                label: "UF",
                                controller: _controllerUF,
                                items: estados.entries.map((e) => DropdownMenuEntry(value: e.key, label: e.value)).toList(),
                                inputKey: _ufFieldKey,
                                onChanged: (value) => setState(() {
                                  _ufSelected = value.toString();
                                }),
                                initialValue: _ufSelected ?? "", //usuario.endereco?.uf ?? "",
                              ),
                            ]),
                            footer: BrGrid(
                                margin: 0,
                                gutter: 8,
                                runSpacing: 8,
                                children: [
                                  BrResponsiveItem(
                                      xs: 12,
                                      sm: 6,
                                      child: BrButton(
                                          text: "Salvar Endereço",
                                          onPressed: () =>
                                              _salvarEndereco(usuario))),
                                  BrResponsiveItem(
                                      xs: 12,
                                      sm: 6,
                                      child: BrButton(
                                          text: "Apagar Endereço",
                                          type: BrButtonType.secondary,
                                          onPressed: () =>
                                              _apagarEndereco(usuario)))
                                ])))),
                const BrResponsiveItem(
                  xs: 0,
                  md: 0,
                  xl: 0,
                  child: SizedBox.shrink(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
