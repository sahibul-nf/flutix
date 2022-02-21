part of 'models.dart';

class User extends Equatable {
  String? id;
  String? fullName;
  String? email;
  String? avatar;
  List<String>? favoriteGenres;
  String? preferredFilmLanguage;
  int? balance;

  User(this.id, this.email,
      {this.fullName,
      this.avatar,
      this.favoriteGenres,
      this.preferredFilmLanguage,
      this.balance});

  @override
  List<Object?> get props => [
        id,
        fullName,
        email,
        avatar,
        favoriteGenres,
        preferredFilmLanguage,
        balance
      ];

  factory User.fromJson(Map<String, dynamic> json) {
    var user = User(json['uid'], json['email']);
    user.fullName = json['full_name'];
    user.avatar = json['avatar_url'];
    user.preferredFilmLanguage = json['preferrend_file_language'];
    user.balance = json['balance'];

    String temp = json['favorite_genres'];
    user.favoriteGenres = temp.split(",");
    return user;
  }
}
