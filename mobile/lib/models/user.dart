import 'package:equatable/equatable.dart';

class User extends Equatable {
  /// The unique identifier
  final String id;

  /// Constructs a new User object with the [id] argument
  User(this.id);

  /// Creates a copy with optional [id] arguments
  User copyWith({String id}) {
    return User(id ?? this.id);
  }

  /// Returns a [String] representation of the object
  @override
  String toString() {
    return 'User{id: $id}';
  }

  /// Returns a [Map<String, dynamic>] from the current object
  Map<String, dynamic> toJson() {
    return {
      "id": id,
    };
  }

  /// Returns a User object created from the [json] map taken as an argument
  static User fromJson(Map<String, dynamic> json) {
    return User(json["id"]);
  }
}
