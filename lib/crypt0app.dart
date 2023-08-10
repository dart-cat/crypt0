import 'package:flutter/material.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class Crypt0App extends StatelessWidget {
  const Crypt0App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypt0',
      theme: darkTheme,
      routes: routes,
      //initialRoute: '/coinsList' <- если захотим переопределить '/'
    );
  }
}