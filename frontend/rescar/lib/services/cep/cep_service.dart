import 'dart:async';

import 'package:rescar/models/usuario.dart';
import 'package:rescar/services/service.dart';
import 'cep_rest.dart';

class CepService with Service {
  CepService({required this.restService});

  final CepRestService restService;

  Future<Endereco> get(String? cep) async {
    return fromJsonObject(() => restService.get(cep), (json) => Endereco.fromJson(json));
  }

}
