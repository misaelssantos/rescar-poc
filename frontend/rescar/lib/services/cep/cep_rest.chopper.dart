// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cep_rest.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$CepRestService extends CepRestService {
  _$CepRestService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CepRestService;

  @override
  Future<Response<dynamic>> get(String? cep) {
    final Uri $url = Uri.parse('/v1/cep');
    final Map<String, dynamic> $params = <String, dynamic>{'cep': cep};
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
}
