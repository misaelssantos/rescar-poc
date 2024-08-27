import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:govbr_ds/components/br_card.dart';
import 'package:govbr_ds/components/br_grid.dart';
import 'package:govbr_ds/components/br_header.dart';
import 'package:govbr_ds/components/br_input.dart';
import 'package:govbr_ds/components/br_loading.dart';
import 'package:govbr_ds/components/br_password.dart';
import 'package:govbr_ds/components/br_select.dart';
import 'package:govbr_ds/theme/theme_colors.dart';
import 'package:govbr_ds/theme/theme_values.dart';
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

class UsuariosScreen extends StatefulWidget {
  const UsuariosScreen({super.key});

  @override
  State<UsuariosScreen> createState() => _UsuariosScreenState();
}

class _UsuariosScreenState extends State<UsuariosScreen> {
  late UsuariosService _usuariosService;
  late Future<List<Usuario>> _usuarios;
  late InfoUsuario? _usuarioLogado;
  late String _filtro;
  late String _perfilSelected;
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
  final _perfilFieldKey =
      GlobalKey<FormFieldState<String>>(debugLabel: "perfil");

  @override
  void initState() {
    super.initState();
    _filtro = "";
    _usuariosService = Provider.of<UsuariosService>(context, listen: false);
    _usuarioLogado = Provider.of<InfoUsuario?>(context,
        listen: false); //TODO se usar listen , precisa colocar no método build!
    _refreshDadosUsuario();
  }

  Future<void> _refreshDadosUsuario() async {
    setState(() {
      _perfilSelected = "";
      _usuarios = FutureUtil.withError(context,
          _usuariosService.list(null)); //, (usuario) => Future.value(usuario)
    });
  }

  bool _salvarDadosBasicos(Usuario usuario) {
    if (_formDadosBasicosKey.currentState!.validate()) {
      String email = _emailFieldKey.currentState!.value!.replaceAll('\t', '');
      String nome = _nomeFieldKey.currentState!.value!.replaceAll('\t', '');
      String senha = _senhaFieldKey.currentState!.value!.replaceAll('\t', '');

      FutureUtil.withOverlayAndError(
          context,
          _usuariosService.atualizarDadosBasicos(
            usuario.id!,
            DadosBasicos(nome: nome, email: email, senha: senha),
          ), (resposta) async {
        _refreshDadosUsuario();
        AlertUtil.success(
            context, "Dados Básicos alterados com sucesso!", false);
        return resposta;
      });

      return true; //TODO Corrigir retorno async
    } else {
      AlertUtil.error(context, "Formulário Dados Básicos inválido!");
      return false;
    }
  }

  bool _salvarNovoUsuario() {
    if (_formDadosBasicosKey.currentState!.validate()) {
      String email = _emailFieldKey.currentState!.value!.replaceAll('\t', '');
      String nome = _nomeFieldKey.currentState!.value!.replaceAll('\t', '');
      String senha = _senhaFieldKey.currentState!.value!.replaceAll('\t', '');
      // String perfil = _perfilFieldKey.currentState!.value!.replaceAll('\t', '');

      FutureUtil.withOverlayAndError(
          context,
          _usuariosService.novoUsuario(
            Usuario(
                email: email,
                nome: nome,
                senha: senha,
                perfil: _perfilSelected),
          ), (resposta) async {
        _refreshDadosUsuario();
        AlertUtil.success(context, "Usuário incluído com sucesso!", false);
        return resposta;
      });

      return true; //TODO Corrigir retorno async
    } else {
      AlertUtil.error(context, "Formulário Novo Usuário inválido!");
      return false;
    }
  }

  bool _salvarEndereco(Usuario usuario) {
    if (_formEnderecoKey.currentState!.validate()) {
      String? cep = _cepFieldKey.currentState!.value;
      String? logradouro = _logradouroFieldKey.currentState!.value;
      String? complemento = _complementoFieldKey.currentState!.value;
      String? numero = _numeroFieldKey.currentState!.value;
      String? bairro = _bairroFieldKey.currentState!.value;
      String? localidade = _localidadeFieldKey.currentState!.value;
      String? uf = _ufSelected; //_ufFieldKey.currentState!.value;

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
        FutureUtil.withOverlayAndError(
            context,
            _usuariosService.atualizarEndereco(
                usuario.id!, usuario.copyWith(endereco: endereco)),
            (resposta) async {
          _refreshDadosUsuario();
          AlertUtil.success(context, "Endereço alterado com sucesso!", false);
          return resposta; //TODO Corrigir retorno async
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
        FutureUtil.withOverlayAndError(
            context,
            _usuariosService.atualizarEndereco(
                usuario.id!, usuario.copyWith(endereco: endereco)),
            (resposta) async {
          _refreshDadosUsuario();
          AlertUtil.success(context, "Endereço incluído com sucesso!", false);
          return resposta;
        });
      }
      return true;
    } else {
      AlertUtil.error(context, "Formulário Endereço inválido!");
      return false;
    }
  }

  // _apagarEndereco(Usuario usuario) async {
  //   if (usuario.endereco != null && usuario.endereco!.id != null) {
  //     await FutureUtil.withOverlayAndError(
  //         context, _usuariosService.removerEndereco(usuario.id!),
  //         (resposta) async {
  //       _refreshDadosUsuario();
  //       AlertUtil.success(context, "Endereço apagado com sucesso!", false);
  //       return resposta;
  //     });
  //   }
  // }

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
          _ufSelected = endereco.uf;
          _controllerUF.text = estados[endereco.uf] ?? "";
          _logradouroFieldKey.currentState!.didChange(endereco.logradouro);
        });
        return endereco;
      });
    }
  }

  String _formataPerfil(String perfil) {
    switch (perfil) {
      case "A":
        return "Administrador";
      case "M":
        return "Motorista";
      case "C":
        return "Colaborador";
      default:
        return perfil;
    }
  }

  _onPesquisa(String texto) {
    setState(() {
      _filtro = texto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrHeader(
          title: "Usuários", assinatura: "Rescar", onPesquisa: _onPesquisa),
      drawer: RescarMenu(usuarioLogado: _usuarioLogado),
      bottomNavigationBar: const RescarFooter(),
      floatingActionButton: FloatingActionButton(
        child: const FaIcon(
          FontAwesomeIcons.plus,
        ),
        onPressed: () {
          _openNovoUsuario();
        },
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<Usuario>>(
          future: _usuarios,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: BrLoading());
            }
            List<Usuario>? usuarios = snapshot.data ?? [];

            List<BrResponsiveItem> lista = usuarios
                .where((e) =>
                    e.nome!.toLowerCase().contains(_filtro.toLowerCase()))
                .map((usuario) => BrResponsiveItem(
                    xs: 12,
                    md: 6,
                    lg: 4,
                    xl: 3,
                    child: BrCard(
                      header: ListTile(
                        leading: const CircleAvatar(
                            backgroundColor: Color(0XFFdbe8fb),
                            child: FaIcon(
                              FontAwesomeIcons.solidUser,
                              color: Color(0XFFc5d4eb),
                            )),
                        trailing: Chip(
                          labelStyle: const TextStyle(color: Colors.white),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          label: Text(
                              usuario.situacao == "A" ? "Ativo" : "Inativo"),
                          backgroundColor: usuario.situacao == "A"
                              ? ThemeColors.success
                              : ThemeColors.errorTextColor,
                        ),
                        title: Text(_formataPerfil(usuario.perfil ?? "")),
                        subtitle: Text(usuario.nome ?? ""),
                        contentPadding: const EdgeInsets.all(0),
                      ),
                      onTap: () => _openDadosBasicos(usuario),
                      footer: Row(
                        children: [
                          IconButton(
                              onPressed: () => _openPerfil(usuario),
                              icon: const FaIcon(
                                FontAwesomeIcons.lock,
                              )),
                          IconButton(
                              onPressed: () => _openEndereco(usuario),
                              icon: const FaIcon(
                                FontAwesomeIcons.mapLocation,
                              )),
                          IconButton(
                              onPressed: () => _alterarSituacao(usuario),
                              icon: FaIcon(
                                usuario.situacao == "A"
                                    ? FontAwesomeIcons.circleXmark
                                    : FontAwesomeIcons.check,
                              )),
                        ],
                      ),
                    )))
                .toList();

            return BrGrid(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: <BrResponsiveItem>[...lista],
            );
          },
        ),
      ),
    );
  }

  _openNovoUsuario() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              insetPadding: EdgeInsets.zero,
              scrollable: true,
              title: Row(children: [
                const Expanded(child: Text('Novo Usuário')),
                IconButton(
                    onPressed: () {
                      bool fechar = _salvarNovoUsuario();
                      if (fechar) {
                        Navigator.of(context).pop();
                      }
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.check,
                    )),
                IconButton(
                    onPressed: () => {Navigator.of(context).pop()},
                    icon: const FaIcon(
                      FontAwesomeIcons.xmark,
                    ))
              ]),
              surfaceTintColor: ThemeColors.backgroundColor,
              backgroundColor: ThemeColors.backgroundColor,
              shadowColor: ThemeColors.backgroundColor,
              shape:
                  const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
              content: ConstrainedBox(
                constraints: Responsive.isMobileSize(context)
                    ? BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height,
                        minWidth: MediaQuery.of(context).size.width,
                      )
                    : const BoxConstraints(
                        minWidth: ThemeValues
                            .defaultModalMinWidth), //TODO ver parametro?
                child: Form(
                  key: _formDadosBasicosKey,
                  child:
                      // BrGrid(
                      //   children: [
                      //     BrResponsiveItem(
                      //         xs: 12,
                      //         md: 6,
                      //         xl: 4,
                      //         child:
                      Column(mainAxisSize: MainAxisSize.min, children: [
                    BrInput(
                      inputKey: _emailFieldKey,
                      label: "Email",
                      initialValue: "",
                      validator: (value) => (value == null || value.isEmpty)
                          ? "Campo obrigatório"
                          : null,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    BrInput(
                      inputKey: _nomeFieldKey,
                      label: "Nome",
                      initialValue: "",
                      validator: (value) => (value == null || value.isEmpty)
                          ? "Campo obrigatório"
                          : null,
                    ),
                    BrPassword(
                      inputKey: _senhaFieldKey,
                      label: "Senha",
                      initialValue: "",
                      validator: (value) => (value == null || value.isEmpty)
                          ? "Campo obrigatório"
                          : null,
                    ),
                    BrSelect(
                      inputKey: _perfilFieldKey,
                      label: "Perfil",
                      initialValue: _perfilSelected,
                      controller: TextEditingController(),
                      enabled: true,
                      items: const [
                        DropdownMenuEntry(value: "A", label: "Administrador"),
                        DropdownMenuEntry(value: "M", label: "Motorista"),
                        DropdownMenuEntry(value: "C", label: "Colaborador")
                      ],
                      onChanged: (value) => setState(() {
                        _perfilSelected = value.toString();
                      }),
                      validator: (value) =>
                          (value == null || value.toString().isEmpty)
                              ? "Campo obrigatório"
                              : null,
                    ),
                  ]
                          //       )),
                          // ],
                          ),
                ),
              ));
        });
  }

  _openDadosBasicos(Usuario usuario) async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            scrollable: true,
            title: Row(children: [
              const Expanded(child: Text('Dados Básicos')),
              IconButton(
                  onPressed: () {
                    bool fechar = _salvarDadosBasicos(usuario);
                    if (fechar) {
                      Navigator.of(context).pop();
                    }
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.check,
                  )),
              IconButton(
                  onPressed: () => {Navigator.of(context).pop()},
                  icon: const FaIcon(
                    FontAwesomeIcons.xmark,
                  ))
            ]),
            surfaceTintColor: ThemeColors.backgroundColor,
            backgroundColor: ThemeColors.backgroundColor,
            shadowColor: ThemeColors.backgroundColor,
            shape:
                const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
            content: ConstrainedBox(
                constraints: Responsive.isMobileSize(context)
                    ? BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height,
                        minWidth: MediaQuery.of(context).size.width,
                      )
                    : const BoxConstraints(
                        minWidth: ThemeValues
                            .defaultModalMinWidth), //TODO ver parametro?
                child: Form(
                  key: _formDadosBasicosKey,
                  child:
                      // BrGrid(
                      //   children: [
                      //     BrResponsiveItem(
                      //         xs: 12,
                      //         md: 6,
                      //         xl: 4,
                      //         child:
                      Column(mainAxisSize: MainAxisSize.min, children: [
                    BrInput(
                      inputKey: _emailFieldKey,
                      label: "Email",
                      initialValue: usuario.email,
                      validator: (value) => (value == null || value.isEmpty)
                          ? "Campo obrigatório"
                          : null,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    BrInput(
                      inputKey: _nomeFieldKey,
                      label: "Nome",
                      initialValue: usuario.nome,
                      validator: (value) => (value == null || value.isEmpty)
                          ? "Campo obrigatório"
                          : null,
                    ),
                    BrPassword(
                      inputKey: _senhaFieldKey,
                      label: "Senha",
                      initialValue: usuario.senha,
                      validator: (value) => (value == null || value.isEmpty)
                          ? "Campo obrigatório"
                          : null,
                    ),
                  ]
                          //       )),
                          // ],
                          ),
                )),
          );
        });
  }

  _openEndereco(Usuario usuario) async {
    _ufSelected = usuario.endereco?.uf ?? "";
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              insetPadding: EdgeInsets.zero,
              scrollable: true,
              title: Row(children: [
                const Expanded(child: Text('Endereço')),
                IconButton(
                    onPressed: () {
                      bool fechar = _salvarEndereco(usuario);
                      if (fechar) {
                        Navigator.of(context).pop();
                      }
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.check,
                    )),
                IconButton(
                    onPressed: () => {Navigator.of(context).pop()},
                    icon: const FaIcon(
                      FontAwesomeIcons.xmark,
                    ))
              ]),
              surfaceTintColor: ThemeColors.backgroundColor,
              backgroundColor: ThemeColors.backgroundColor,
              shadowColor: ThemeColors.backgroundColor,
              shape:
                  const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
              content: ConstrainedBox(
                constraints: Responsive.isMobileSize(context)
                    ? BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height,
                        minWidth: MediaQuery.of(context).size.width,
                      )
                    : const BoxConstraints(
                        minWidth: ThemeValues
                            .defaultModalMinWidth), //TODO ver parametro?
                child: Form(
                  key: _formEnderecoKey,
                  child:
                      // BrGrid(
                      //   children: [
                      //     BrResponsiveItem(
                      //         xs: 12,
                      //         md: 6,
                      //         xl: 4,
                      //         child:
                      Column(mainAxisSize: MainAxisSize.min, children: [
                    BrInput(
                      label: "Cep",
                      inputKey: _cepFieldKey,
                      initialValue: usuario.endereco?.cep ?? "",
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      validator: (value) => (value == null || value.isEmpty)
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
                      initialValue: usuario.endereco?.logradouro ?? "",
                    ),
                    BrInput(
                      label: "Complemento",
                      inputKey: _complementoFieldKey,
                      initialValue: usuario.endereco?.complemento ?? "",
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
                      initialValue: usuario.endereco?.localidade ?? "",
                    ),
                    BrSelect(
                      label: "UF",
                      controller: _controllerUF,
                      items: estados.entries
                          .map((e) =>
                              DropdownMenuEntry(value: e.key, label: e.value))
                          .toList(),
                      inputKey: _ufFieldKey,
                      onChanged: (value) => setState(() {
                        _ufSelected = value.toString();
                      }),
                      initialValue:
                          _ufSelected ?? "", //usuario.endereco?.uf ?? "",
                    ),
                    // BrInput(
                    //   label: "UF",
                    //   inputKey: _ufFieldKey,
                    //   initialValue: usuario.endereco?.uf ?? "",
                    // ),
                  ]),
                ),
              ));
        });
  }

  _openPerfil(Usuario usuario) async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Selecione o Perfil'),
            surfaceTintColor: ThemeColors.backgroundColor,
            backgroundColor: ThemeColors.backgroundColor,
            shadowColor: ThemeColors.backgroundColor,
            shape:
                const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () async {
                  _alterarPerfil(usuario, Perfil(perfil: "A"));
                  Navigator.of(context).pop();
                },
                child: const Text('Administrador'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  _alterarPerfil(usuario, Perfil(perfil: "C"));
                  Navigator.of(context).pop();
                },
                child: const Text('Colaborador'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  _alterarPerfil(usuario, Perfil(perfil: "M"));
                  Navigator.of(context).pop();
                },
                child: const Text('Motorista'),
              ),
            ],
          );
        });
  }

  _alterarSituacao(Usuario usuario) async {
    await FutureUtil.withOverlayAndError(
        context,
        _usuariosService.alterarSituacao(
          usuario.id!,
          Situacao(situacao: usuario.situacao == "A" ? "I" : "A"),
        ), (resposta) async {
      _refreshDadosUsuario();
      AlertUtil.success(context, "Situação alterada com sucesso!", false);
      return resposta;
    });
  }

  _alterarPerfil(Usuario usuario, Perfil perfil) async {
    await FutureUtil.withOverlayAndError(
        context,
        _usuariosService.alterarPerfil(
          usuario.id!,
          perfil,
        ), (resposta) async {
      _refreshDadosUsuario();
      AlertUtil.success(context, "Perfil alterado com sucesso!", false);
      return resposta;
    });
  }
}
