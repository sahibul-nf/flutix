part of 'pages.dart';

class AccountConfirmationPage extends StatefulWidget {
  const AccountConfirmationPage(this.registrationData, {Key? key})
      : super(key: key);
  final RegistrationData? registrationData;

  @override
  State<AccountConfirmationPage> createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context
            .read<PageBloc>()
            .add(GoToProfilingSelectedPage(widget.registrationData));
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Confirm \nNew Account",
            style: AppTextStyle.titleStyle.copyWith(
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          elevation: 0,
          iconTheme: const IconThemeData(
            color: ColorPallete.primaryColor,
          ),
          toolbarHeight: 90,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                height: 150,
                width: 150,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: (widget.registrationData?.avatar != null)
                      ? Theme.of(context).colorScheme.tertiary.withOpacity(0.1)
                      : Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(140),
                  // border: Border.all(
                  //   color: ColorPallete.greyColor,
                  // ),
                ),
                child: (widget.registrationData?.avatar == null)
                    ? Icon(
                        Icons.person,
                        size: 100,
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(140),
                        child: Image.file(
                          File(widget.registrationData!.avatar!.path),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              const SizedBox(height: 30),
              Text("Welcome", style: AppTextStyle.normalStyle),
              const SizedBox(height: 6),
              Text(
                "${widget.registrationData?.fullName}",
                style: AppTextStyle.titleStyle.copyWith(
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              (isLoading)
                  ? SpinKitFadingCircle(
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: GradientButtonFb1(
                          text: "Create My Account",
                          width: double.infinity,
                          color: Theme.of(context).colorScheme.tertiary,
                          onPressed: () {
                            // context.read<PageBloc>().add(GoToMainPage());

                            createAccount();
                          }),
                    ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }

  void createAccount() async {
    setState(() {
      isLoading = true;
    });

    final result = await AuthServices.signUp(
      widget.registrationData!.fullName.toString(),
      widget.registrationData!.email.toString(),
      widget.registrationData!.password.toString(),
      widget.registrationData!.favoriteGenres!,
      widget.registrationData!.preferredFilmLanguage.toString(),
    );

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
      imageToUpload = widget.registrationData?.avatar;
      context.read<PageBloc>().add(GoToMainPage());
    }
    // else {
    //   UserServices.uploadAvatar(widget.registrationData!.avatar!)
    //       .then((avatarUrl) {
    //     // if (avatarUrl != "") {
    //     context.read<UserBloc>().add(UpdateUser(avatar: avatarUrl));

    //     setState(() {
    //       isLoading = false;
    //     });

    // } else {
    //   setState(() {
    //     isLoading = false;
    //   });

    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(
    //         "Failed to upload avatar.",
    //         style: AppTextStyle.normalStyle,
    //       ),
    //       backgroundColor: Theme.of(context).colorScheme.error,
    //       duration: const Duration(seconds: 4),
    //       // margin: const EdgeInsets.all(10),
    //     ),
    //   );
    // }
    // });

    // }
  }
}
