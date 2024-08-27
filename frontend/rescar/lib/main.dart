import 'package:flutter/material.dart';
import 'package:govbr_ds/theme/theme_data.dart';
import 'package:provider/provider.dart';
import 'package:rescar/utils/providers.dart';
import 'package:rescar/utils/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: Providers.getProviders(),
        child: MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Rescar',
          initialRoute: '/',
          onGenerateRoute: RouterGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
          theme: brThemeData,
        ));
  }
}
