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
}
