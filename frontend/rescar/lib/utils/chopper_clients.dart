import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:http/io_client.dart' as http;
import 'package:rescar/services/authentication/http_authorization_interceptor.dart';

class ChopperClients {

  static ChopperClient chopper = ChopperClient(
    // baseUrl: Uri.parse("http://localhost:8081"), // desenvolvimento local
    // baseUrl: Uri.parse("http://10.139.70.140:8080"), // iac
    baseUrl: Uri.parse("/api"), // docker-compose e estaleiro
    client: kIsWeb
        ? null
        : http.IOClient(
            HttpClient()..connectionTimeout = const Duration(seconds: 10),
          ),
    converter: const JsonConverter(),
    errorConverter: const JsonConverter(),
    interceptors: [HttpLoggingInterceptor(), HttpAuthorizationInterceptor()],
  );
}
