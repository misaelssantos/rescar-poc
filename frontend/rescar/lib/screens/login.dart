import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:govbr_ds/components/br_button.dart';
import 'package:govbr_ds/components/br_card.dart';
import 'package:govbr_ds/components/br_footer.dart';
import 'package:govbr_ds/components/br_footer_category.dart';
import 'package:govbr_ds/components/br_grid.dart';
import 'package:govbr_ds/components/br_header.dart';
import 'package:govbr_ds/components/br_input.dart';
import 'package:govbr_ds/components/br_password.dart';
import 'package:govbr_ds/theme/theme_colors.dart';
import 'package:govbr_ds/utils/responsive.dart';
import 'package:provider/provider.dart';
import 'package:rescar/components/rescar_footer.dart';
import 'package:rescar/models/credentials.dart';
import 'package:rescar/services/authentication/authentication_service.dart';
import 'package:rescar/utils/alert_util.dart';
import 'package:rescar/utils/future_util.dart';
import 'package:govbr_ds/components/br_overlay_loading.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.title = "Login"});
  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthenticationService _service;
  final _formKey = GlobalKey<FormState>();
  final _emailFieldKey = GlobalKey<FormFieldState<String>>(debugLabel: "email");
  final _senhaFieldKey = GlobalKey<FormFieldState<String>>(debugLabel: "senha");
  TextEditingController emailController =
      TextEditingController(text: "administrador@hotmail.com");
  TextEditingController senhaController = TextEditingController(text: "123456");

  @override
  void initState() {
    super.initState();
    _service = Provider.of<AuthenticationService>(context, listen: false);
    _service.logout();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      String email = _emailFieldKey.currentState!.value!.replaceAll('\t', '');
      String senha = _senhaFieldKey.currentState!.value!.replaceAll('\t', '');
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      FutureUtil.withOverlayAndError<InfoUsuario?>(
          context,
          _service.login(Credentials(
            email: email,
            senha: senha,
          )),
          _loginOk);
    } else {
      AlertUtil.error(context, "Login Inválido!");
    }
  }

  Future<InfoUsuario?> _loginOk(FutureOr<InfoUsuario?> info) async {
    final navigator = Navigator.of(context);
    InfoUsuario infoUsuario = (await info)!;
    print(infoUsuario);
    await navigator.pushReplacementNamed('/home');
    return info;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BrHeader(),
        bottomNavigationBar: const RescarFooter(),
        body: BrOverlayLoading(
          child: SafeArea(
              child: Center(
                  child: SingleChildScrollView(
                      child: Form(
                          key: _formKey,
                          child: BrGrid(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                const BrResponsiveItem(
                                  xs: 0,
                                  sm: 2,
                                  md: 3,
                                  lg: 2,
                                  xl: 2,
                                  child: SizedBox.shrink(),
                                ),
                                BrResponsiveItem(
                                  xs: 12,
                                  sm: 8,
                                  md: 6,
                                  lg: 4,
                                  xl: 4,
                                  child: Column(children: [
                                    const FaIcon(
                                      FontAwesomeIcons.car,
                                      size: 48,
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(24),
                                        child: Text(
                                          "Rescar",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge,
                                        )),
                                  ]),
                                ),
                                const BrResponsiveItem(
                                  xs: 0,
                                  sm: 2,
                                  md: 3,
                                  lg: 0,
                                  xl: 0,
                                  child: SizedBox.shrink(),
                                ),
                                const BrResponsiveItem(
                                  xs: 0,
                                  sm: 2,
                                  md: 3,
                                  lg: 0,
                                  xl: 0,
                                  child: SizedBox.shrink(),
                                ),
                                BrResponsiveItem(
                                  xs: 12,
                                  sm: 8,
                                  md: 6,
                                  lg: 4,
                                  xl: 4,
                                  child: Column(children: [
                                    BrCard(
                                        header: const Text("Login"),
                                        content: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            BrInput(
                                              label: "Email",
                                              inputKey: _emailFieldKey,
                                              // controller: emailController,
                                              initialValue:
                                                  "administrador@hotmail.com",
                                              validator: (value) =>
                                                  (value == null ||
                                                          value.isEmpty)
                                                      ? "Campo obrigatório"
                                                      : null,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                            ),
                                            BrPassword(
                                              label: "Senha",
                                              inputKey: _senhaFieldKey,
                                              controller: senhaController,
                                              validator: (value) =>
                                                  (value == null ||
                                                          value.isEmpty)
                                                      ? "Campo obrigatório"
                                                      : null,
                                              onFieldSubmitted: (val) =>
                                                  _login(),
                                              textInputAction:
                                                  TextInputAction.done,
                                            )
                                          ],
                                        ),
                                        footer: BrGrid(
                                            margin: 0,
                                            gutter: 8,
                                            runSpacing: 8,
                                            children: [
                                              const BrResponsiveItem(
                                                xs: 0,
                                                sm: 6,
                                                md: 4,
                                                lg: 8,
                                                child: SizedBox.shrink(),
                                              ),
                                              BrResponsiveItem(
                                                  xs: 12,
                                                  sm: 6,
                                                  md: 8,
                                                  lg: 4,
                                                  child: BrButton(
                                                      text: "Entrar",
                                                      onPressed: () =>
                                                          _login()))
                                            ])),
                                  ]),
                                ),
                                const BrResponsiveItem(
                                  xs: 0,
                                  sm: 2,
                                  md: 3,
                                  lg: 2,
                                  xl: 2,
                                  child: SizedBox.shrink(),
                                ),
                              ]))))),
        ));
  }
}
