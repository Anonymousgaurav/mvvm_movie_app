import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_architecture_flutter/models/session_model.dart';
import 'package:mvvm_architecture_flutter/repository/auth_repository.dart';
import 'package:mvvm_architecture_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_architecture_flutter/viewmodel/session_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _repository = AuthRepository();
  bool _loading = false;

  bool get loading => _loading;

  progressBar(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginViewModel(dynamic data, BuildContext context) async {
    _repository.loginUser(data).then((value) {
      progressBar(false);
      final userPreference =
          Provider.of<SessionViewModel>(context, listen: false);
      userPreference.saveUser(SessionModel(token: value['token'].toString()));
      Navigator.pushNamed(context, RouteName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      progressBar(false);
      print(error.toString());
    });
  }

  Future<void> registerViewModel(dynamic data, BuildContext context) async {
    _repository.registerUser(data).then((value) {
      progressBar(false);
      Navigator.pushNamed(context, RouteName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      progressBar(false);
      print(error.toString());
    });
  }
}
