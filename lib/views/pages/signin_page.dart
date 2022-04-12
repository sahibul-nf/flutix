part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailTextC = TextEditingController();

  final _passwordTextC = TextEditingController();

  bool isEmailValid = false;

  bool isPasswordValid = false;

  bool isEmpty = true;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(GoToSplashPage());
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.primary,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/app_icon3x.png",
                  width: 70,
                ),
                const SizedBox(height: 70),
                Text(
                  "Welcome Back, \nExplorer!",
                  style: AppTextStyle.titleStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                TextFieldWithLabel(
                  inputController: _emailTextC,
                  title: "Email",
                  hintText: "example@gmail.com",
                  onChanged: (v) {
                    if (v.isEmpty) {
                      setState(() {
                        isEmpty = true;
                      });
                    } else if (v.isNotEmpty) {
                      setState(() {
                        isEmpty = false;
                        isEmailValid = EmailValidator.validate(v);
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),
                TextFieldWithLabel(
                  inputController: _passwordTextC,
                  obsecure: true,
                  title: "Password",
                  onChanged: (v) {
                    if (v.isEmpty) {
                      setState(() {
                        isEmpty = true;
                      });
                    } else if (v.isNotEmpty) {
                      setState(() {
                        isEmpty = false;
                        isPasswordValid = v.length >= 6;
                      });
                    }
                  },
                ),
                const SizedBox(height: 30),
                isLoading
                    ? SpinKitFadingCircle(
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : GradientButtonFb1(
                        text: "Sign In",
                        width: double.infinity,
                        onPressed: _signIn,
                      ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Start fresh now? ",
                      style: AppTextStyle.mediumStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context
                            .read<PageBloc>()
                            .add(GoToRegisterPage(RegistrationData()));
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const SignUpPage(),
                        //   ),
                        // );
                      },
                      child: Text(
                        "Sign Up",
                        style: AppTextStyle.mediumStyle.copyWith(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signIn() async {
    if (isEmpty == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Please fill in your email and password!",
            style: AppTextStyle.normalStyle,
          ),
          backgroundColor: Theme.of(context).colorScheme.error,
          duration: const Duration(seconds: 4),
          // margin: const EdgeInsets.all(10),
        ),
      );
    } else {
      if (!isEmailValid) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Email is not valid",
              style: AppTextStyle.normalStyle,
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
            duration: const Duration(seconds: 4),
            // margin: const EdgeInsets.all(10),
          ),
        );
      } else if (!isPasswordValid) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Password length is at least 6",
              style: AppTextStyle.normalStyle,
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    }

    if (isEmailValid && isPasswordValid) {
      setState(() {
        isLoading = true;
      });

      final result =
          await AuthServices.signIn(_emailTextC.text, _passwordTextC.text);
      if (result.errorMessage != null) {
        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "${result.errorMessage}",
              style: AppTextStyle.normalStyle,
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
            duration: const Duration(seconds: 4),
            // margin: const EdgeInsets.all(10),
          ),
        );
      } else {
        setState(() {
          isLoading = false;
        });

        context.read<PageBloc>().add(GoToMainPage());
      }
    }
  }
}
