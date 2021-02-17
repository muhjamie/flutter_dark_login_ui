import 'package:login/router.dart';
import 'package:login/ui/auth/welcome.dart';
import 'package:flutter/material.dart';
import 'theme/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoute.generateRoute,
      home: WelcomeScreen(),
    );
  }
}
