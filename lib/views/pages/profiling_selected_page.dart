part of 'pages.dart';

class ProfilingSelectedPage extends StatefulWidget {
  const ProfilingSelectedPage(this.registrationData, {Key? key})
      : super(key: key);

  final RegistrationData? registrationData;

  @override
  State<ProfilingSelectedPage> createState() => _ProfilingSelectedPageState();
}

class _ProfilingSelectedPageState extends State<ProfilingSelectedPage> {
  String preferLanguage = "";
  Set<String> favoriteGenres = {};

  var genres = [
    "Drama",
    "Music",
    "War",
    "Action",
    "Horor",
    "crime",
  ];

  var languages = [
    "English",
    "Indonesia",
    "Arab",
    "French",
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(GoToRegisterPage(widget.registrationData));
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        body: Container(
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Your \nFavorite Genre",
                style: AppTextStyle.titleStyle,
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 220,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 60,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: genres.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (favoriteGenres.length < 4) {
                          if (favoriteGenres.contains(genres[index])) {
                            setState(() {
                              favoriteGenres.remove(genres[index]);
                            });
                          } else {
                            setState(() {
                              favoriteGenres.add(genres[index]);
                            });
                          }
                        } else {
                          if (favoriteGenres.contains(genres[index])) {
                            setState(() {
                              favoriteGenres.remove(genres[index]);
                            });
                          }
                        }
                      },
                      child: Container(
                        // height: 60,
                        decoration: BoxDecoration(
                          color: favoriteGenres.contains(genres[index])
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).scaffoldBackgroundColor,
                          border: Border.all(
                            color: favoriteGenres.contains(genres[index])
                                ? Theme.of(context).colorScheme.secondary
                                : ColorPallete.greyColor,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            genres[index],
                            style: AppTextStyle.normalStyle,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Movie Language \nYou Prefer?",
                style: AppTextStyle.titleStyle,
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 140,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 60,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          preferLanguage = languages[index];
                        });
                      },
                      child: Container(
                        // height: 60,
                        decoration: BoxDecoration(
                          color: preferLanguage == languages[index]
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).scaffoldBackgroundColor,
                          border: Border.all(
                            color: preferLanguage == languages[index]
                                ? Theme.of(context).colorScheme.secondary
                                : ColorPallete.greyColor,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            languages[index],
                            style: AppTextStyle.normalStyle,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Spacer(),
              GradientButtonFb1(
                text: "Continue",
                width: double.infinity,
                color: (preferLanguage.isEmpty || favoriteGenres.length < 4)
                    ? Theme.of(context).colorScheme.primary.withOpacity(.7)
                    : null,
                onPressed: (preferLanguage.isEmpty || favoriteGenres.length < 4)
                    ? null
                    : () {
                        continueRegistrationStep();
                      },
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }

  void continueRegistrationStep() {
    widget.registrationData?.favoriteGenres = favoriteGenres;
    widget.registrationData?.preferredFilmLanguage = preferLanguage;

    context
        .read<PageBloc>()
        .add(GoToAccountConfirmationPage(widget.registrationData));
  }
}
