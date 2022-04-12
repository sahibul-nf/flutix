part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage(this.registrationData, {Key? key}) : super(key: key);

  final RegistrationData? registrationData;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final fullnameTextC = TextEditingController();

  final emailTextC = TextEditingController();

  final passwordTextC = TextEditingController();

  final confirmPasswordTextC = TextEditingController();

  bool isLoading = false;
  bool confirmPassword = false;
  String? errName;
  String? errEmail;
  String? errPassword;
  String? errConfirmPassword;
  bool isEmpty = true;

  File? pickedFile;

  void pickImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        pickedFile = File(file.path);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Can't pick that image"),
          duration: Duration(seconds: 4),
        ),
      );
    }
  }

  bool validateForm() {
    if (fullnameTextC.text == "" ||
        emailTextC.text == "" ||
        passwordTextC.text == "" ||
        confirmPasswordTextC.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Please completed all the fields"),
          backgroundColor: Theme.of(context).colorScheme.error,
          duration: const Duration(seconds: 4),
        ),
      );
      return false;
    }

    return true;
  }

  void continueRegistrationStep() async {
    // check validation form
    final isValid = validateForm();
    if (isValid) {
      final emailAlreadyInUse =
          await AuthServices.checkIfEmailInUse(emailTextC.text.trim());
      if (emailAlreadyInUse) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "${emailTextC.text.trim()} already Associated with Another Account.",
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
            duration: const Duration(seconds: 4),
          ),
        );
      } else {
        // set Registration Data
        widget.registrationData?.fullName = fullnameTextC.text.trim();
        widget.registrationData?.email = emailTextC.text.trim();
        widget.registrationData?.password = passwordTextC.text.trim();
        widget.registrationData?.avatar = pickedFile;

        context
            .read<PageBloc>()
            .add(GoToProfilingSelectedPage(widget.registrationData));
      }
    }
    // widget.registrationData?.email = "snf@gmail.om";
  }

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).colorScheme.primary;
    var secondaryColor = Theme.of(context).colorScheme.secondary;

    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(GoToSplashPage());
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Create Account",
            style: AppTextStyle.titleStyle.copyWith(
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          elevation: 0,
          iconTheme: const IconThemeData(
            color: ColorPallete.primaryColor,
          ),
          // toolbarHeight: 90,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      (pickedFile == null)
                          ? Icon(
                              Icons.person,
                              size: 70,
                              color: primaryColor,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.file(
                                pickedFile!,
                                height: 90,
                                width: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: (pickedFile == null)
                            ? InkWell(
                                onTap: pickImage,
                                child: Icon(
                                  Icons.add_a_photo_outlined,
                                  color: primaryColor,
                                ),
                              )
                            : InkWell(
                                onTap: () => setState(() {
                                  pickedFile = null;
                                }),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.error,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(
                                    Icons.close_rounded,
                                    color:
                                        Theme.of(context).colorScheme.onError,
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                TextFieldWithLabel(
                  inputController: fullnameTextC,
                  title: "Full Name",
                  errText: errName,
                  onChanged: (v) {
                    if (v.isEmpty) {
                      setState(() {
                        errName = "Fill your name";
                      });
                    } else {
                      setState(() {
                        errName = null;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),
                TextFieldWithLabel(
                  inputController: emailTextC,
                  title: "Email",
                  errText: errEmail,
                  hintText: "example@gmail.com",
                  onChanged: (v) {
                    if (v.isEmpty) {
                      setState(() {
                        errEmail = "Fill your email";
                      });
                    } else if (!EmailValidator.validate(v)) {
                      setState(() {
                        errEmail = "Email invalid";
                      });
                    } else {
                      setState(() {
                        errEmail = null;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),
                TextFieldWithLabel(
                  inputController: passwordTextC,
                  obsecure: true,
                  errText: errPassword,
                  title: "Password",
                  onChanged: (v) {
                    if (v.isEmpty) {
                      setState(() {
                        errPassword = "Fill your password";
                      });
                    } else if (passwordTextC.text.length < 6) {
                      setState(() {
                        errPassword = "Password at least 6 character";
                      });
                    } else if (passwordTextC.text.length == 6) {
                      setState(() {
                        errPassword = null;
                      });
                    } else if (passwordTextC.text !=
                        confirmPasswordTextC.text) {
                      setState(() {
                        errConfirmPassword =
                            "Mismacth Password and Confirm Password";
                      });
                    } else {
                      setState(() {
                        errPassword = null;
                        errConfirmPassword = null;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),
                TextFieldWithLabel(
                  inputController: confirmPasswordTextC,
                  obsecure: true,
                  errText: errConfirmPassword,
                  title: "Confirm Password",
                  onChanged: (v) {
                    if (v.isEmpty) {
                      setState(() {
                        errConfirmPassword = "Fill your password";
                      });
                    } else if (passwordTextC.text !=
                        confirmPasswordTextC.text) {
                      setState(() {
                        errConfirmPassword =
                            "Mismacth Password and Confirm Password";
                      });
                    } else {
                      setState(() {
                        errConfirmPassword = null;
                      });
                    }
                  },
                ),
                const SizedBox(height: 30),
                GradientButtonFb1(
                  text: "Continue",
                  width: double.infinity,
                  onPressed: () {
                    continueRegistrationStep();
                  },
                ),
                const SizedBox(height: 50),
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
                      },
                      child: Text(
                        "Sign In",
                        style: AppTextStyle.mediumStyle.copyWith(
                          fontSize: 14,
                          color: primaryColor,
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
}
