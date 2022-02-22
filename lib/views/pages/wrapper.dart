import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutix/bloc/page_bloc.dart';
import 'package:flutix/shared/shared.dart';
import 'package:flutix/views/pages/main_page.dart';
import 'package:flutix/views/pages/signin_page.dart';
import 'package:flutix/views/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? firebaseUser = Provider.of<User?>(context);

    if (firebaseUser == null) {
      if (prevPageEvent is! GoToSplashPage) {
        prevPageEvent = GoToSplashPage();
        context.read<PageBloc>().add(GoToSplashPage());
      }
    } else {
      if (prevPageEvent is! GoToMainPage) {
        prevPageEvent = GoToMainPage();
        context.read<PageBloc>().add(GoToMainPage());
      }
    }

    return BlocBuilder<PageBloc, PageState>(
      builder: (_, pageState) => (pageState is OnSplashPage)
          ? const SplashPage()
          : (pageState is OnLoginPage)
              ? const SignInPage()
              : const MainPage(),
    );
  }
}
