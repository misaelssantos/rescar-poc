import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:rescar/models/usuario.dart';

part 'usuarios_rest.chopper.dart';

@ChopperApi(baseUrl: "/v1/usuarios")
abstract class UsuariosRestService extends ChopperService {
  static UsuariosRestService create([ChopperClient? client]) => _$UsuariosRestService(client);

  @Get(path: '', headers: {
    contentTypeKey: jsonHeaders,
  })
  Future<Response> list(@Query() String? perfil);

  @Get(path: '/{id}', headers: {
    contentTypeKey: jsonHeaders,
  })
  Future<Response> get(@Path() String id);

  @Put(path: '/{id}', headers: {
    contentTypeKey: jsonHeaders,
  })
  Future<Response> put(@Path() String id, @Body() DadosBasicos dadosBasicos);

  @Post(path: '', headers: {
    contentTypeKey: jsonHeaders,
  })
  Future<Response> post(@Body() Usuario usuario);


  @Put(path: '/{id}/endereco', headers: {
    contentTypeKey: jsonHeaders,
  })
  Future<Response> putEndereco(@Path() String id, @Body() Usuario usuario);

  @Post(path: '/{id}/endereco', headers: {
    contentTypeKey: jsonHeaders,
  })
  Future<Response> postEndereco(@Path() String id, @Body() Usuario usuario);

  @Delete(path: '/{id}/endereco', headers: {
    contentTypeKey: jsonHeaders,
  })
  Future<Response> deleteEndereco(@Path() String id);

  @Put(path: '/{id}/situacao', headers: {
    contentTypeKey: jsonHeaders,
  })
  Future<Response> putSituacao(@Path() String id, @Body() Situacao situacao);

  @Put(path: '/{id}/perfil', headers: {
    contentTypeKey: jsonHeaders,
  })
  Future<Response> putPerfil(@Path() String id, @Body() Perfil perfil);

}
