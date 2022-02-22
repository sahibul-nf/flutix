import 'package:flutix/services/services.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                AuthServices.signUp(
                        "Sahibul", "snf@gmail.com", "131211", ["romance"], "")
                    .then((value) {
                  print(value.user);
                  print(value.errorMessage);
                });
              },
              child: const Text("Sign Up"),
            ),
            ElevatedButton(
              onPressed: () {
                AuthServices.signOut();
              },
              child: const Text("Sign Out"),
            ),
          ],
        ),
      ),
    );
  }
}
