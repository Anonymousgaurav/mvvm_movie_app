import 'package:mvvm_architecture_flutter/data/network/BaseApiServices.dart';
import 'package:mvvm_architecture_flutter/data/network/NetworkApiService.dart';
import 'package:mvvm_architecture_flutter/models/movies_model.dart';
import 'package:mvvm_architecture_flutter/utils/net_config.dart';

class MoviesListRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<MoviesModel> getMoviesList() async {
    try {
      dynamic response =
          await _apiService.getGetApiResponse(NetConfig.moviesUrl);
      return response = MoviesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
