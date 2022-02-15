import 'package:flutix/services/services.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AuthServices.signUp(
                    "Sahibul", "snf12@gmail.com", "123456", ["romance"], "")
                .then((value) {
              print(value.user);
              print(value.errorMessage);
            });
          },
          child: const Text("Sign Up"),
        ),
      ),
    );
  }
}
