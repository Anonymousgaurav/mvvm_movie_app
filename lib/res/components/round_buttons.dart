import 'package:flutter/material.dart';
import 'package:mvvm_architecture_flutter/res/colors.dart';

class RoundButton extends StatefulWidget {
  final String title;

  final bool loading;

  final VoidCallback onPress;

  const RoundButton(
      {required this.title,
      required this.loading,
      required this.onPress,
      Key? key})
      : super(key: key);

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onPress,
        child: Container(
          height: 40,
          width: 200,
          decoration: BoxDecoration(
              color: AppColors.buttonColor,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: widget.loading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text("Login")),
        ));
  }
}
