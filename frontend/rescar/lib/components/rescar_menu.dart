import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:govbr_ds/components/br_menu.dart';
import 'package:govbr_ds/theme/theme_colors.dart';
import 'package:rescar/models/credentials.dart';

class RescarMenu extends StatelessWidget {
  final InfoUsuario? usuarioLogado;

  const RescarMenu(
      {this.usuarioLogado,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BrMenu(
        title: "Rescar",
        subtitle: "Versão 0.0.1_SNAPSHOT",
        logo: const FaIcon(
          FontAwesomeIcons.car,
          color: ThemeColors.primary,
          size: 36,
        ),
        isCollapsible: true,
        itens: [
          BrMenuItem(
              title: "Tela Inicial",
              icon: const FaIcon(
                FontAwesomeIcons.house,
              ),
              onTap: () => {Navigator.popAndPushNamed(context, '/home')}),
          BrMenuItem(
              title: "Meus Dados",
              icon: const FaIcon(
                FontAwesomeIcons.solidUser,
              ),
              onTap: () => {Navigator.popAndPushNamed(context, '/meus-dados')}),
          if (usuarioLogado?.perfil == "A")
            BrMenuItem(
                title: "Usuários",
                icon: const FaIcon(
                  FontAwesomeIcons.users,
                ),
                onTap: () => {Navigator.popAndPushNamed(context, '/usuarios')}),
          BrMenuItem(
              title: "Sair",
              icon: const FaIcon(
                FontAwesomeIcons.rightFromBracket,
              ),
              onTap: () => {Navigator.popAndPushNamed(context, '/login')}),
        ],
      );
  }
}