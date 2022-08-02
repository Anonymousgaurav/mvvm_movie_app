import 'package:mvvm_architecture_flutter/data/network/BaseApiServices.dart';
import 'package:mvvm_architecture_flutter/data/network/NetworkApiService.dart';
import 'package:mvvm_architecture_flutter/utils/net_config.dart';

class AuthRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginUser(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(NetConfig.loginUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registerUser(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getGetApiResponse(NetConfig.registerUrl);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
