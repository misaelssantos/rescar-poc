import 'dart:async';
import 'package:flutter/material.dart';
import 'package:govbr_ds/components/br_overlay_loading.dart';
import 'package:rescar/utils/alert_util.dart';

class FutureUtil {
  static Future<T> withOverlayAndError<T>(BuildContext context, Future<T> future, Future<T> Function(T) then, {Function(dynamic)? onError}) {
    BrOverlayLoading loading = BrOverlayLoading.of(context);
    loading.show();
    return future
        .then((a) {
          loading.hide();
          return a;
        })
        .then(then)
        .catchError((error) {
          loading.hide();
          if (onError == null) {
            tratarError(context, error);
          } else {
            onError(error);
          }
          return null as T;
        });
  }

  static Future<T> withError<T>(BuildContext context, Future<T> future) {
    return future.catchError((error) {
      tratarError(context, error);
      return null as T;
    });
  }

  static tratarError(BuildContext context, dynamic error) {
    //TODO
    print(error.toString());
    AlertUtil.error(context, "Erro inesperado!");
    // if (error.toString().contains(Constants.FUTURE_UTIL_TRATAR_ERRO)) {
    //   Navigator.pushReplacementNamed(context, "/login", arguments: Constants.FUTURE_UTIL_SESSAO_EXPIRADA);
    // } else if (error.toString().contains(Constants.HTML_SERVICO_INDISPONIVEL)) {
    //   AlertUtil.error(context, Constants.FUTURE_UTIL_TENTE_MAIS_TARDE);
    // } else if (error is SocketException) {
    //   if (Platform.isAndroid && error.osError?.errorCode == 101) {
    //     AlertUtil.error(context, Constants.FUTURE_UTIL_VERIFIQUE_INTERNET);
    //   } else {
    //     AlertUtil.error(context, Constants.FUTURE_UTIL_TENTE_MAIS_TARDE);
    //   }
    // } else {
    //   AlertUtil.error(context, error);
    // }
  }
}
