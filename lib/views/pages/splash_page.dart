part of 'pages.dart';
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/app_icon3x.png",
              width: 130,
            ),
            const SizedBox(height: 90),
            Text("New Experience", style: AppTextStyle.titleStyle),
            const SizedBox(height: 16),
            Text(
              "Watch a new movie much \neasier than any before",
              style: AppTextStyle.desciptionStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            GradientButtonFb1(
              text: "Get Started",
              onPressed: () {
                context
                    .read<PageBloc>()
                    .add(GoToRegisterPage(RegistrationData()));
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: AppTextStyle.mediumStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<PageBloc>().add(GoToLoginPage());
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => SignInPage(),
                    //   ),
                    // );
                  },
                  child: Text(
                    "Sign In",
                    style: AppTextStyle.mediumStyle.copyWith(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
