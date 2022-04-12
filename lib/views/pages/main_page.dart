part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.account_balance_wallet,
          color: Colors.black45,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipPath(
        clipper: BottomNavbarClipper(),
        child: Container(
          height: 80,
          color: Theme.of(context).colorScheme.surface,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              InkWell(
                onTap: () {
                  setState(() {
                    activeIndex = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      activeIndex == 0
                          ? "assets/icons/ic_movies.png"
                          : "assets/icons/ic_movies_grey.png",
                      height: 24,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Movie",
                      style: AppTextStyle.normalStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 3),
              InkWell(
                onTap: () {
                  setState(() {
                    activeIndex = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      activeIndex == 1
                          ? "assets/icons/ic_tickets.png"
                          : "assets/icons/ic_tickets_gray.png",
                      height: 24,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Ticket",
                      style: AppTextStyle.normalStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
      body: MoviePage(),
    );
  }
}

class BottomNavbarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width / 2 - 36, 0);
    path.quadraticBezierTo(size.width / 2 - 36, 36, size.width / 2, 36);
    path.quadraticBezierTo(size.width / 2 + 36, 36, size.width / 2 + 36, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
