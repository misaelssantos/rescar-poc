import 'dart:async';
import 'package:chopper/chopper.dart';

part 'cep_rest.chopper.dart';

@ChopperApi(baseUrl: "/v1/cep")
abstract class CepRestService extends ChopperService {
  static CepRestService create([ChopperClient? client]) => _$CepRestService(client);

  @Get(path: '', headers: {
    contentTypeKey: jsonHeaders,
  })
  Future<Response> get(@Query() String? cep);

}