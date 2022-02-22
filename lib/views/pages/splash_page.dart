import 'package:flutix/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Splash Page"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              context.read<PageBloc>().add(GoToLoginPage());
            },
            child: const Text("Login")),
      ),
    );
  }
}
