import 'package:flutter/material.dart';
import 'package:mvvm_architecture_flutter/utils/routes/app_navigator.dart';
import 'package:mvvm_architecture_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_architecture_flutter/viewmodel/auth_view_model.dart';
import 'package:mvvm_architecture_flutter/viewmodel/session_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => SessionViewModel())
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        initialRoute: RouteName.splash,
        onGenerateRoute: AppNavigator.generatedRoute,
      ),
    );
  }
}
