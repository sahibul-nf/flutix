part of 'services.dart';

class AuthServices {
  static final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  static Future<UserResultFormatter> signUp(
    String fullName,
    String email,
    String password,
    Set<String> favoriteGenre,
    String preferredFilmLanguage,
  ) async {
    try {
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      var user = User(result.user?.uid, result.user?.email,
          name: "No Name",
          balance: 50000,
          avatar: "",
          favoriteGenres: const {},
          preferredFilmLanguage: "English");
      user.id = result.user?.uid;
      user.name = fullName;
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

  // Returns true if email address is in use.
  static Future<bool> checkIfEmailInUse(String emailAddress) async {
    try {
      // Fetch sign-in methods for the email address
      final list = await _auth.fetchSignInMethodsForEmail(emailAddress);

      // In case list is not empty
      if (list.isNotEmpty) {
        // Return true because there is an existing
        // user using the email address
        return true;
      } else {
        // Return false because email adress is not in use
        return false;
      }
    } catch (error) {
      // Handle error
      // ...
      return true;
    }
  }

  static Stream<auth.User?> get authStream => _auth.authStateChanges();
}
