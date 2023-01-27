import 'package:flutter/material.dart';
import 'package:mvvm_prac/utills/routes/routes_name.dart';
import 'package:mvvm_prac/view/home_screen.dart';
import 'package:mvvm_prac/view/login_screen.dart';
import 'package:mvvm_prac/view/sign_up_view.dart';
import 'package:mvvm_prac/view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    final argume = setting.arguments;
    switch (setting.name) {
        
      case RoutesName.splash:
        return MaterialPageRoute(builder: ((context) => SplashView()));
      case RoutesName.home:
        return MaterialPageRoute(builder: ((context) => HomeScreen()));
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());
      case RoutesName.SignUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignUpView());
        
    

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No routes defined'),
            ),
          );
        });
    }
  }
}
