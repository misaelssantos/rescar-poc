import 'package:flutter/material.dart';
import 'package:govbr_ds/components/br_overlay_loading.dart';
import 'package:rescar/screens/home.dart';
import 'package:rescar/screens/login.dart';
import 'package:rescar/screens/meus_dados.dart';
import 'package:rescar/screens/usuarios.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute<dynamic>(
          builder: (context) => BrOverlayLoading(child: const LoginScreen()),
        );
      case '/login':
        return MaterialPageRoute<dynamic>(
          builder: (context) {
            if (args is String) {
              // return LoginScreen(errorMessage: args);
              return BrOverlayLoading(child: const LoginScreen());
            } else {
              return BrOverlayLoading(child: const LoginScreen());
            }
          },
        );
      case '/home':
        return MaterialPageRoute<dynamic>(
          builder: (context) => BrOverlayLoading(child: const HomeScreen()),
        );
      case '/meus-dados':
        return MaterialPageRoute<dynamic>(
          builder: (context) => BrOverlayLoading(child: const MeusDadosScreen()),
        );
      case '/usuarios':
        return MaterialPageRoute<dynamic>(
          builder: (context) => BrOverlayLoading(child: const UsuariosScreen()),
        );
      default:
        return _erroRoute();
    }
  }

  static Route _erroRoute() => MaterialPageRoute<dynamic>(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Tela não existe"),
          ),
          body: const Center(
            child: Text("Tela não encontrada no RouterGenerator!"),
          ),
        ),
      );
}
