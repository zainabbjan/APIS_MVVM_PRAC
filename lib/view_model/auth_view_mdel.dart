import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_prac/repository/auth_reposiory.dart';
import 'package:mvvm_prac/utills/routes/routes_name.dart';
import 'package:mvvm_prac/utills/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;
  setsignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.LoginApi(data).then((value) {
      Utils.flushBarErrorMessage('Login successfull', context);
      Navigator.pushNamed(context, RoutesName.home);
      setLoading(false);
      if (kDebugMode) {
        print(value.toString());
      }
      ;
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> SignUpApi(dynamic data, BuildContext context) async {
    setsignUpLoading(true);
    _myRepo.RegisterApi(data).then((value) {
      Utils.flushBarErrorMessage('Sign Up successfull', context);
      Navigator.pushNamed(context, RoutesName.home);
      setsignUpLoading(false);
      if (kDebugMode) {
        print(value.toString());
      }
      ;
    }).onError((error, stackTrace) {
      setsignUpLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
