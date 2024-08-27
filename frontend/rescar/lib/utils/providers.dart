import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rescar/models/credentials.dart';
import 'package:rescar/services/authentication/authentication_rest.dart';
import 'package:rescar/services/authentication/authentication_service.dart';
import 'package:rescar/services/cep/cep_rest.dart';
import 'package:rescar/services/cep/cep_service.dart';
import 'package:rescar/services/usuarios/usuarios_rest.dart';
import 'package:rescar/services/usuarios/usuarios_service.dart';
import 'package:rescar/utils/chopper_clients.dart';

class Providers {
  static List<SingleChildWidget> getProviders() {
    return [
      Provider<AuthenticationRestService>(
          create: (_) =>
              AuthenticationRestService.create(ChopperClients.chopper),
          dispose: (_, AuthenticationRestService service) =>
              service.client.dispose()),
      Provider<AuthenticationService>(
        create: (context) => AuthenticationService(
            restService:
                Provider.of<AuthenticationRestService>(context, listen: false)),
      ),
      StreamProvider<InfoUsuario?>(
          create: (context) =>
              Provider.of<AuthenticationService>(context, listen: false)
                  .usuario,
          initialData: null),
      Provider<UsuariosRestService>(
          create: (_) => UsuariosRestService.create(ChopperClients.chopper), dispose: (_, UsuariosRestService service) => service.client.dispose()),
      Provider<UsuariosService>(create: (context) => UsuariosService(restService: Provider.of<UsuariosRestService>(context, listen: false))),
      Provider<CepRestService>(
          create: (_) => CepRestService.create(ChopperClients.chopper), dispose: (_, CepRestService service) => service.client.dispose()),
      Provider<CepService>(create: (context) => CepService(restService: Provider.of<CepRestService>(context, listen: false))),
    ];
  }
}
