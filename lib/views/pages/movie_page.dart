part of 'pages.dart';

class MoviePage extends StatelessWidget {
  MoviePage({Key? key}) : super(key: key);

  List<String> movieIcons = [
    "ic_action.png",
    "ic_drama.png",
    "ic_music.png",
    "ic_war.png",
    "ic_crime.png"
  ];

  String _buildGenreIcons(String genre) {
    var icon = '';

    if (genre == 'crime') {
      icon = 'ic_crime.png';
    } else if (genre == 'Action') {
      icon = 'ic_action.png';
    } else if (genre == 'War') {
      icon = 'ic_war.png';
    } else if (genre == 'Drama') {
      icon = 'ic_drama.png';
    } else if (genre == 'Music') {
      icon = 'ic_music.png';
    } else if (genre == 'Horor') {
      icon = 'ic_horor.png';
    }

    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // App Bar
        _buildAppBar(context),

        // Content
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const SizedBox(height: 20),
              // Now Playing
              _buildNowPlaying(context),

              const SizedBox(height: 30),
              // Movie Categories
              _buildMovieCategories(context),

              const SizedBox(height: 30),
              // Cooming Soon Movie
              _buildCoomingSoonMovie(context),

              const SizedBox(height: 30),
              // Get Lucky Day
              _buildLuckyDay(context),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      toolbarHeight: 100,
      centerTitle: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: BlocBuilder<UserBloc, UserState>(
        builder: (_, userState) {
          String? avatar;
          if (userState is UserLoaded) {
            avatar = userState.user.avatar;
            log("UserLoaded");

            if (imageToUpload != null) {
              UserServices.uploadAvatar(imageToUpload!).then((avatarUrl) {
                imageToUpload = null;

                context.read<UserBloc>().add(UpdateUser(avatar: avatarUrl));
              });
            }

            return Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorPallete.greyColor,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: (avatar == "")
                          ? Center(
                              child: SpinKitFadingCircle(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            )
                          : Image.network(
                              userState.user.avatar.toString(),
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, widget, loadImage) {
                                if (loadImage == null) return widget;

                                return Center(
                                  child: SpinKitFadingCircle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                );
                              },
                            )),
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "👋 hi, " + userState.user.name.toString(),
                        style: AppTextStyle.mediumStyle.copyWith(
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Rp " + userState.user.balance.toString(),
                        style: AppTextStyle.mediumStyle.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          if (userState is UserUpdated) {
            log("UserUpdated");

            return Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorPallete.greyColor,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        userState.user.avatar.toString(),
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, widget, loadImage) {
                          if (loadImage == null) return widget;

                          return Center(
                            child: SpinKitFadingCircle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          );
                        },
                      )),
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "👋 hi, " + userState.user.name.toString(),
                        style: AppTextStyle.mediumStyle.copyWith(
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Rp " + userState.user.balance.toString(),
                        style: AppTextStyle.mediumStyle.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          return Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorPallete.greyColor,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.2),
                      child: Icon(
                        Icons.person,
                        size: 36,
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5),
                      ),
                    )),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "👋 hi, ---",
                      style: AppTextStyle.mediumStyle.copyWith(
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Rp 0",
                      style: AppTextStyle.mediumStyle.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      actions: [
        IconButton(
          onPressed: () {
            AuthServices.signOut();
            context.read<UserBloc>().add(SignOut());
          },
          icon: const Icon(Icons.logout, color: Colors.black54),
        ),
        const SizedBox(width: 4),
      ],
    );
  }

  Widget _buildNowPlaying(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Now Playing",
            style: AppTextStyle.mediumStyle,
          ),
          const SizedBox(height: 10),
          Container(
            height: 140,
            width: 210,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieCategories(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Browse Movie",
            style: AppTextStyle.mediumStyle,
          ),
          const SizedBox(height: 10),
          BlocBuilder<UserBloc, UserState>(
            builder: (_, userState) {
              List<String> favoriteGenres = [];
              if (userState is UserLoaded) {
                favoriteGenres.addAll(userState.user.favoriteGenres!.toList());
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var i = 0; i < favoriteGenres.length; i++)
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        "assets/icons/${_buildGenreIcons(favoriteGenres[i])}",
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCoomingSoonMovie(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cooming Soon",
            style: AppTextStyle.mediumStyle,
          ),
          const SizedBox(height: 10),
          Container(
            height: 180,
            width: 140,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLuckyDay(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cooming Soon",
            style: AppTextStyle.mediumStyle,
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/illustrations/ill_lucky_day.png",
            ),
          ),
        ],
      ),
    );
  }
}
