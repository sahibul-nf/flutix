import 'package:flutix/shared/shared.dart';
import 'package:flutter/material.dart';

class TextFieldWithLabel extends StatelessWidget {
  final TextEditingController inputController;
  final String title;
  final String? hintText;
  final String? errText;
  final bool obsecure;
  final Function(String) onChanged;

  const TextFieldWithLabel(
      {Key? key,
      required this.inputController,
      required this.title,
      this.hintText,
      required this.onChanged,
      this.errText,
      this.obsecure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = ColorPallete.greyColor;
    var focusColor = Theme.of(context).colorScheme.secondary;
    var errorColor = Theme.of(context).colorScheme.error;

    return Container(
      height: errText != null ? 70 : 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.1)),
        ],
      ),
      child: TextField(
        obscureText: obsecure,
        controller: inputController,
        onChanged: onChanged,
        style: const TextStyle(fontSize: 14, color: Colors.black),
        decoration: InputDecoration(
          label: Text(title),
          labelStyle: const TextStyle(color: primaryColor),
          // prefixIcon: Icon(Icons.email),
          // filled: true,
          // fillColor: accentColor,
          errorText: errText,
          errorStyle: TextStyle(color: Theme.of(context).colorScheme.error),
          hintText: hintText ?? "",
          hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: errorColor, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusColor, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: errorColor, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}
