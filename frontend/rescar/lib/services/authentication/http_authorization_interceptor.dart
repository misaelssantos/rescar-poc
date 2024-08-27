import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:provider/provider.dart';
import 'package:rescar/main.dart';
import 'package:rescar/models/credentials.dart';
import 'package:rescar/services/authentication/authentication_service.dart';

class HttpAuthorizationInterceptor implements RequestInterceptor, ResponseInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    var info = Provider.of<InfoUsuario?>(MyApp.navigatorKey.currentContext!, listen: false);

    if (info != null) {
      Request newRequest = request.copyWith(headers: {...request.headers, "Authorization": info.jwt});
      return newRequest;
    } else {
      return request;
    }
  }

  @override
  FutureOr<Response> onResponse(Response response) {
    String? authorization = response.headers["authorization"];
    if (authorization != null) {
      var service = Provider.of<AuthenticationService?>(MyApp.navigatorKey.currentContext!, listen: false);
      String jwt = authorization;
      service?.atualizarJWT(jwt);
    }

    return response;
  }
}
