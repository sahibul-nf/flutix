part of 'models.dart';

class User extends Equatable {
  String? id;
  String? name;
  String? email;
  String? avatar;
  Set<String>? favoriteGenres;
  String? preferredFilmLanguage;
  int? balance;

  User(this.id, this.email,
      {this.name,
      this.avatar,
      this.favoriteGenres,
      this.preferredFilmLanguage,
      this.balance});

  @override
  List<Object?> get props =>
      [id, name, email, avatar, favoriteGenres, preferredFilmLanguage, balance];

  factory User.fromJson(Map<String, dynamic> json) {
    var user = User(json['uid'], json['email']);
    user.name = json['full_name'];
    user.avatar = json['avatar_url'];
    user.preferredFilmLanguage = json['preferrend_file_language'];
    user.balance = json['balance'];

    String temp = json['favorite_genres'];
    user.favoriteGenres = temp.split(",").toSet();
    return user;
  }

  User copyWith({String? name, String? avatar, int? balance}) {
    return User(
      id,
      email,
      name: name ?? this.name,
      balance: balance ?? this.balance,
      avatar: avatar ?? this.avatar,
      favoriteGenres: favoriteGenres,
      preferredFilmLanguage: preferredFilmLanguage,
    );
  }
}
