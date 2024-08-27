import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:rescar/models/credentials.dart';

part 'authentication_rest.chopper.dart';

@ChopperApi(baseUrl: "")
abstract class AuthenticationRestService extends ChopperService {
  static AuthenticationRestService create([ChopperClient? client]) => _$AuthenticationRestService(client);

  @Post(path: '/login', headers: {
    contentTypeKey: jsonHeaders,
  })
  Future<Response> login(@Body() Credentials credentials);

}
