import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_architecture_flutter/view/screens/home_view.dart';
import 'package:mvvm_architecture_flutter/view/screens/login_view.dart';
import 'package:mvvm_architecture_flutter/view/screens/signup_view.dart';
import 'package:mvvm_architecture_flutter/view/screens/splash_view.dart';

class AppNavigator {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());
      case RouteName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginView());
      case RouteName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpView());
      case RouteName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}
