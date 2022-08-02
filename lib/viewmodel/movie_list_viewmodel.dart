import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_architecture_flutter/data/response/api_response.dart';
import 'package:mvvm_architecture_flutter/models/movies_model.dart';
import 'package:mvvm_architecture_flutter/repository/movie_list_repository.dart';

class MoviesListViewModel with ChangeNotifier {
  final _repository = MoviesListRepository();

  bool _loading = false;

  bool get loading => _loading;

  ApiResponse<MoviesModel> movieList = ApiResponse.loading();

  setMovieList(ApiResponse<MoviesModel> response) {
    movieList = response;
    notifyListeners();
  }

  progressBar(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> movieListViewModel() async {
    setMovieList(ApiResponse.loading());
    _repository.getMoviesList().then((value) {
      //progressBar(false);
      setMovieList(ApiResponse.completed(value));

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      //progressBar(false);
      setMovieList(ApiResponse.error(error.toString()));
      print(error.toString());
    });
  }
}
