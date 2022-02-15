part of 'services.dart';

class UserServices {
  static final CollectionReference _users =
      FirebaseFirestore.instance.collection("users");

  static Future<void> updateUser(User? user) async {
    String genres = "";
    var favoriteGenres = user!.favoriteGenres;

    if (favoriteGenres!.isNotEmpty) {
      for (var genre in favoriteGenres) {
        genres += genre + ((genre != favoriteGenres.last) ? "," : "");
      }
    }

    _users.doc(user.id).set({
      'full_name': user.fullName,
      'email': user.email,
      'favorite_genres': genres,
      'balance': user.balance,
      'preferrend_film_language': user.preferredFilmLanguage,
      'avatar_url': user.avatar ?? ""
    });
  }
}
