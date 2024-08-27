import 'dart:async';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:rescar/main.dart';
import 'package:rescar/services/service.dart';
import 'package:rescar/models/credentials.dart';
import 'authentication_rest.dart';

class AuthenticationService with Service {
  AuthenticationService({required this.restService});

  final AuthenticationRestService restService;
  final StreamController<InfoUsuario?> _controller = StreamController<InfoUsuario?>.broadcast();

  Stream<InfoUsuario?> get usuario => _controller.stream;

  void atualizarJWT(String jwt) async {
    InfoUsuario? usuarioAtual = Provider.of<InfoUsuario?>(MyApp.navigatorKey.currentContext!, listen: false);
    if (usuarioAtual != null) {
      var usuarioAtualizado = usuarioAtual.copyWith(jwt: jwt);
      _controller.sink.add(usuarioAtualizado);
    }
  }

  Future<bool> isLogged() async => (await _controller.stream.last)?.jwt != null;

  void logout() {
    _controller.sink.add(null);
  }

  Future<InfoUsuario> login(Credentials credentials) async {
    var headers = await fromHeader(() => restService.login(credentials), (headers) => headers);
    String jwt = headers["authorization"];
    Map<String, dynamic> decodedToken = JwtDecoder.decode(jwt);
    var info = InfoUsuario(nome: decodedToken["nome"], id: decodedToken["id"], exp: decodedToken["exp"], iat: decodedToken["iat"], email: decodedToken["email"], perfil: decodedToken["perfil"], jwt: jwt);
    _controller.sink.add(info);
    return info;
  }

}
