// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_rest.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$AuthenticationRestService extends AuthenticationRestService {
  _$AuthenticationRestService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AuthenticationRestService;

  @override
  Future<Response<dynamic>> login(Credentials credentials) {
    final Uri $url = Uri.parse('/login');
    final Map<String, String> $headers = {
      'content-type': 'application/json',
    };
    final $body = credentials;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
