part of 'services.dart';

class AuthServices {
  static final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  static Future<UserResultFormatter> signUp(
    String fullName,
    String email,
    String password,
    List<String> favoriteGenre,
    String preferredFilmLanguage,
  ) async {
    try {
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      var user = User(result.user?.uid, result.user?.email,
          fullName: "No Name",
          balance: 50000,
          avatar: "",
          favoriteGenres: const [],
          preferredFilmLanguage: "English");
      user.id = result.user?.uid;
      user.fullName = fullName;
      user.favoriteGenres = favoriteGenre;

      await UserServices.updateUser(user);

      return UserResultFormatter(user, null);
    } catch (e) {
      return UserResultFormatter(null, e.toString());
    }
  }

  static Future<UserResultFormatter> signIn(
      String email, String password) async {
    try {
      auth.UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);

      User user = await UserServices.getUser(userCredential.user!.uid);

      return UserResultFormatter(user, null);
    } on auth.FirebaseAuthException catch (e) {
      return UserResultFormatter(null, e.toString());
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Stream<auth.User?> get authStream => _auth.authStateChanges();
}
