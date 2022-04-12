import 'package:flutix/shared/shared.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 250,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(text, style: AppTextStyle.mediumStyle),
        style: ElevatedButton.styleFrom(
          
        ),
      ),
    );
  }
}
