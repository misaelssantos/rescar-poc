import 'package:chopper/chopper.dart';

mixin Service {
  Future<T> fromJsonObject<T>(Future<Response<dynamic>> Function() getResponse, T Function(dynamic) getValue) async {
    final httpResponse = await getResponse();
    if (httpResponse.isSuccessful) {
      return getValue(httpResponse.body);
    } else if (httpResponse.statusCode == 422) {
      if (httpResponse.error is List<dynamic>) {
        // erro normal de validação
        List<dynamic> mensagens = httpResponse.error as List<dynamic>;
        return Future.error(mensagens);
      } else {
        // erro estruturado
        return Future.value(getValue(httpResponse.error as Map<String, dynamic>));
      }
    } else {
      return Future.error(httpResponse.error.toString());
    }
  }

  Future<T> fromHeader<T>(Future<Response<dynamic>> Function() getResponse, T Function(Map<String, dynamic>) getValue) async {
    final httpResponse = await getResponse();
    if (httpResponse.isSuccessful) {
      return getValue(httpResponse.headers);
    } else if (httpResponse.statusCode == 422) {
      if (httpResponse.error is List<dynamic>) {
        // erro normal de validação
        List<dynamic> mensagens = httpResponse.error as List<dynamic>;
        return Future.error(mensagens);
      } else {
        // erro estruturado
        return Future.value(getValue(httpResponse.error as Map<String, dynamic>));
      }
    } else {
      return Future.error(httpResponse.error.toString());
    }
  }

  Future<List<T>> fromJsonList<T>(Future<Response<dynamic>> Function() getResponse, T Function(Map<String, dynamic>) getValue) async {
    final httpResponse = await getResponse();
    if (httpResponse.isSuccessful) {
      final itens = httpResponse.body as List<dynamic>;
      return itens.map((dynamic item) => getValue(item as Map<String, dynamic>)).toList();
    } else if (httpResponse.statusCode == 422) {
      if (httpResponse.error is List<dynamic>) {
        // erro normal de validação
        List<dynamic> mensagens = httpResponse.error as List<dynamic>;
        return Future.error(mensagens.join("\n"));
      } else {
        return Future.error(httpResponse.error.toString());
      }
    } else {
      return Future.error(httpResponse.error.toString());
    }
  }
}
