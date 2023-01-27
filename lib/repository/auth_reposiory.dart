import 'package:mvvm_prac/data/network/baseApiServices.dart';
import 'package:mvvm_prac/data/network/networkApiServices.dart';
import 'package:mvvm_prac/res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();
  Future<dynamic> LoginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginUrlEndPoint, data);
      return response;
    } catch (e) {}
  }

  Future<dynamic> RegisterApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.registerApiEndpint, data);
      return response;
    } catch (e) {}
  }
}
