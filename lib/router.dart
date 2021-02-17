import 'package:login/ui/auth/signin.dart';
import 'package:flutter/material.dart';
import 'package:login/ui/auth/signup.dart';
import 'package:login/ui/auth/welcome.dart';

class PageViewTransition<T> extends MaterialPageRoute<T> {
  PageViewTransition({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (animation.status == AnimationStatus.reverse)
      return super.buildTransitions(context, animation, secondaryAnimation, child);
    return FadeTransition(opacity: animation, child: child);
  }
}

class AppRoute {
  static const String signinScreen = '/signinScreen';
  static const String signupScreen = '/signupScreen';
  static const String registerScreen = '/registerScreen';
  static const String forgotPassword = '/forgotPassword';
  static const String welcomeScreen = '/welcomeScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signinScreen:
        return PageViewTransition(builder: (_) => SigninScreen());
      case signupScreen:
        return PageViewTransition(builder: (_) => SignupScreen());
      case welcomeScreen:
        return PageViewTransition(builder: (_) => WelcomeScreen());
      default:
        return PageViewTransition(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}
