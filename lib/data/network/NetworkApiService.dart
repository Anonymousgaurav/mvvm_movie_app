import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mvvm_architecture_flutter/data/app_exceptions.dart';
import 'package:mvvm_architecture_flutter/data/network/BaseApiServices.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getGetApiResponse(String url) async {
    dynamic response;
    try {
      final resposne =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 13));

      response = validateResponse(resposne);
    } on SocketException {
      throw DataException("No Internet Connection");
    }

    return response;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic response;
    try {
      Response resposne = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 10));
      response = validateResponse(resposne);
    } on SocketException {
      throw DataException("No Internet Connection");
    }
    return response;
  }

  dynamic validateResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        return BadRequestException(response.body.toString());
      case 404:
        return UnauthorizedRequestException(response.body.toString());
      default:
        throw DataException(
            "Error encountered ${response.statusCode.toString()}");
    }
  }
}
