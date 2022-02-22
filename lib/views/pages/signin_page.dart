import 'package:flutix/services/services.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignIn Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                AuthServices.signIn("snf@gmail.com", "131211").then((value) {
                  print(value.user);
                  print(value.errorMessage);
                });
              },
              child: const Text("Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}
