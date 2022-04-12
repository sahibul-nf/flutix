import 'dart:io';

class RegistrationData {
  String? fullName;
  String? email;
  String? password;
  File? avatar;
  Set<String>? favoriteGenres;
  String? preferredFilmLanguage;

  RegistrationData({
    this.fullName = "",
    this.email = "",
    this.password,
    this.avatar,
    this.favoriteGenres = const {},
    this.preferredFilmLanguage = "",
  });
}
