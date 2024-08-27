import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:govbr_ds/components/br_card.dart';
import 'package:govbr_ds/components/br_footer.dart';
import 'package:govbr_ds/components/br_grid.dart';
import 'package:govbr_ds/components/br_header.dart';
import 'package:govbr_ds/components/br_menu.dart';
import 'package:govbr_ds/theme/theme_colors.dart';
import 'package:govbr_ds/utils/responsive.dart';
import 'package:provider/provider.dart';
import 'package:rescar/components/rescar_footer.dart';
import 'package:rescar/components/rescar_menu.dart';
import 'package:rescar/models/credentials.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  String _formataPerfil(String perfil) {
    switch (perfil) {
      case "A":
        return "Administrador";
      case "M":
        return "Motorista";
      case "C":
        return "Colaborador";
      default:
        return perfil;
    }
  }

  @override
  Widget build(BuildContext context) {
    InfoUsuario? usuario = Provider.of<InfoUsuario?>(context);
    return Scaffold(
      appBar: const BrHeader(title: "Tela Inicial", assinatura: "Rescar"),
      drawer: RescarMenu(usuarioLogado: usuario),
      bottomNavigationBar: const RescarFooter(),
      body: Center(
        child: BrGrid(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <BrResponsiveItem>[
            const BrResponsiveItem(
              xs: 0,
              md: 3,
              xl: 4,
              child: SizedBox.shrink(),
            ),
            BrResponsiveItem(
                xs: 12,
                md: 6,
                xl: 4,
                child: BrCard(
                  header: ListTile(
                    leading: const CircleAvatar(
                        backgroundColor: Color(0XFFdbe8fb),
                        child: FaIcon(
                          FontAwesomeIcons.solidUser,
                          color: Color(0XFFc5d4eb),
                          // size: 48,
                        )),
                    title: Text(_formataPerfil(usuario?.perfil ?? "")),
                    subtitle: Text(usuario?.nome ?? ""),
                    contentPadding: const EdgeInsets.all(0),
                  ),
                  content: const Text("Bem vindo ao Rescar!"),
                )),
            const BrResponsiveItem(
              xs: 0,
              md: 3,
              xl: 4,
              child: SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
