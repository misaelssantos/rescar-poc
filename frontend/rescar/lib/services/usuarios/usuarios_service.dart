import 'dart:async';

import 'package:rescar/models/usuario.dart';
import 'package:rescar/services/service.dart';
import 'usuarios_rest.dart';

class UsuariosService with Service {
  UsuariosService({required this.restService});

  final UsuariosRestService restService;

  Future<List<Usuario>> list(String? perfil) async {
    return fromJsonList(() => restService.list(perfil), (json) => Usuario.fromJson(json));
  }

  Future<Usuario> get(String id) async {
    return fromJsonObject(() => restService.get(id), (json) => Usuario.fromJson(json));
  }

  Future<void> atualizarDadosBasicos(String id, DadosBasicos dadosBasicos) async {
    return fromJsonObject(() => restService.put(id, dadosBasicos), (json) => json);
  }

  Future<void> atualizarEndereco(String id, Usuario usuario) async {
    if(usuario.endereco!.id != null){
      return fromJsonObject(() => restService.putEndereco(id, usuario), (json) => json);
    } else {
      return fromJsonObject(() => restService.postEndereco(id, usuario), (json) => json);
    }
  }

  Future<void> novoUsuario(Usuario usuario) async {
    return fromJsonObject(() => restService.post(usuario), (json) => (json) => json);
  }

  Future<void> removerEndereco(String id) async {
    return fromJsonObject(() => restService.deleteEndereco(id), (json) => json);
  }

  Future<void> alterarSituacao(String id, Situacao situacao) async {
    return fromJsonObject(() => restService.putSituacao(id, situacao), (json) => json);
  }

  Future<void> alterarPerfil(String id, Perfil perfil) async {
    return fromJsonObject(() => restService.putPerfil(id, perfil), (json) => json);
  }

}
