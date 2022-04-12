import 'package:flutix/shared/shared.dart';
import 'package:flutter/material.dart';

class GradientButtonFb1 extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final double? width;
  final Color? color;
  const GradientButtonFb1(
      {required this.text, required this.onPressed, Key? key, this.width, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var primaryColor = color ?? Theme.of(context).colorScheme.primary;
    var secondaryColor = color ?? Theme.of(context).colorScheme.primary.withOpacity(.9);

    const double borderRadius = 15;

    return Container(
      width: width ?? 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          colors: [primaryColor, secondaryColor],
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          alignment: Alignment.center,
          padding: MaterialStateProperty.all(
              const EdgeInsets.only(right: 75, left: 75, top: 15, bottom: 15)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyle.mediumStyle,
        ),
      ),
    );
  }
}
