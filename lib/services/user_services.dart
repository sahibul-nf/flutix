part of 'services.dart';

class UserServices {
  static final CollectionReference _users =
      FirebaseFirestore.instance.collection("users");

  static Future<void> updateUser(User user) async {
    String genres = "";
    var favoriteGenres = user.favoriteGenres;

    if (favoriteGenres!.isNotEmpty) {
      for (var genre in favoriteGenres) {
        genres += genre + ((genre != favoriteGenres.last) ? "," : "");
      }
    }

    _users.doc(user.id).set({
      'full_name': user.name,
      'email': user.email,
      'favorite_genres': genres,
      'balance': user.balance,
      'preferred_film_language': user.preferredFilmLanguage,
      'avatar_url': user.avatar ?? ""
    });
  }

  static Future<User> getUser(String? id) async {
    DocumentSnapshot snapshot = await _users.doc(id).get();

    print(snapshot.data());

    var email = snapshot.get('email');
    var avatarUrl = snapshot.get('avatar_url');
    var balance = snapshot.get('balance');
    var fullName = snapshot.get('full_name');
    var preferredFilmLanguage = snapshot.get('preferred_film_language');

    String temp = snapshot.get('favorite_genres');
    var favoriteGenres = temp.split(",").toSet();

    return User(
      id,
      email,
      avatar: avatarUrl,
      balance: balance,
      favoriteGenres: favoriteGenres,
      name: fullName,
      preferredFilmLanguage: preferredFilmLanguage,
    );
  }

  static Future<String> uploadAvatar(File image) async {
    String fileName = basename(image.path);

    Reference storageRef = FirebaseStorage.instance.ref().child(fileName);

    log("Upload...");
    TaskSnapshot snapshot = await storageRef.putFile(image);

    String downloadUrl = "";
    if (snapshot.state == TaskState.success) {
      log("Success to upload Avatar...");
      log("Get Download URL...");
      downloadUrl = await snapshot.ref.getDownloadURL();
      log("Success to get Download URL...");
      log(downloadUrl);
    }

    return downloadUrl;
  }
}
