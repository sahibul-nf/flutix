part of 'pages.dart';
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var primaryColor = ColorPallete.primaryColor;
    var secondaryColor = ColorPallete.secondaryColor;
    var successColor = ColorPallete.succesColor;
    var errorColor = ColorPallete.errorColor;

    var schema = ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: secondaryColor,
      onSecondary: Colors.white,
      error: errorColor,
      onError: Colors.white,
      background: Theme.of(context).scaffoldBackgroundColor,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.white,
      tertiary: successColor,
      onTertiary: Colors.white,
    );

    context.read<ThemeBloc>().add(
          ChangeTheme(
            ThemeData().copyWith(
              primaryColor: primaryColor,
              colorScheme: schema,
            ),
          ),
        );

    // firebaseUser
    User? firebaseUser = Provider.of<User?>(context);

    if (firebaseUser == null) {
      if (prevPageEvent is! GoToSplashPage) {
        prevPageEvent = GoToSplashPage();
        context.read<PageBloc>().add(GoToSplashPage());
      }
    } else {
      if (prevPageEvent is! GoToMainPage) {
        context.read<UserBloc>().add(LoadUser(firebaseUser.uid));

        prevPageEvent = GoToMainPage();
        context.read<PageBloc>().add(GoToMainPage());
      }
    }

    return BlocBuilder<PageBloc, PageState>(
      builder: (_, pageState) => (pageState is OnSplashPage)
          ? const SplashPage()
          : (pageState is OnLoginPage)
              ? const SignInPage()
              : (pageState is OnRegisterPage)
                  ? SignUpPage(pageState.data)
                  : (pageState is OnProfilingSelectedPage)
                      ? ProfilingSelectedPage(pageState.data)
                      : (pageState is OnAccountConfirmationPage)
                          ? AccountConfirmationPage(pageState.data)
                          : const MainPage(),
    );
  }
}
