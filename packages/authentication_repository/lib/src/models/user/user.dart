import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String? email;
  final String? name;
  final String? photoUrl;
  const User({
    this.name,
    required this.id,
    this.email,
    this.photoUrl,
  });

  User copyWith({
    String? id,
    String? email,
    String? name,
    String? photoUrl,
  }) {
    return User(
        name: name != null ? name : this.name,
        id: id != null ? id : this.id,
        email: email != null ? email : this.email,
        photoUrl: photoUrl != null ? photoUrl : this.photoUrl);
  }

  static const empty = User(id: '');
  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        email,
        photoUrl,
        name,
      ];
}
