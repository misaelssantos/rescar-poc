// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuarios_rest.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$UsuariosRestService extends UsuariosRestService {
  _$UsuariosRestService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = UsuariosRestService;

  @override
  Future<Response<dynamic>> list(String? perfil) {
    final Uri $url = Uri.parse('/v1/usuarios');
    final Map<String, dynamic> $params = <String, dynamic>{'perfil': perfil};
    final Map<String, String> $headers = {
      'content-type': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> get(String id) {
    final Uri $url = Uri.parse('/v1/usuarios/${id}');
    final Map<String, String> $headers = {
      'content-type': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> put(
    String id,
    DadosBasicos dadosBasicos,
  ) {
    final Uri $url = Uri.parse('/v1/usuarios/${id}');
    final Map<String, String> $headers = {
      'content-type': 'application/json',
    };
    final $body = dadosBasicos;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> post(Usuario usuario) {
    final Uri $url = Uri.parse('/v1/usuarios');
    final Map<String, String> $headers = {
      'content-type': 'application/json',
    };
    final $body = usuario;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> putEndereco(
    String id,
    Usuario usuario,
  ) {
    final Uri $url = Uri.parse('/v1/usuarios/${id}/endereco');
    final Map<String, String> $headers = {
      'content-type': 'application/json',
    };
    final $body = usuario;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> postEndereco(
    String id,
    Usuario usuario,
  ) {
    final Uri $url = Uri.parse('/v1/usuarios/${id}/endereco');
    final Map<String, String> $headers = {
      'content-type': 'application/json',
    };
    final $body = usuario;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteEndereco(String id) {
    final Uri $url = Uri.parse('/v1/usuarios/${id}/endereco');
    final Map<String, String> $headers = {
      'content-type': 'application/json',
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> putSituacao(
    String id,
    Situacao situacao,
  ) {
    final Uri $url = Uri.parse('/v1/usuarios/${id}/situacao');
    final Map<String, String> $headers = {
      'content-type': 'application/json',
    };
    final $body = situacao;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> putPerfil(
    String id,
    Perfil perfil,
  ) {
    final Uri $url = Uri.parse('/v1/usuarios/${id}/perfil');
    final Map<String, String> $headers = {
      'content-type': 'application/json',
    };
    final $body = perfil;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
