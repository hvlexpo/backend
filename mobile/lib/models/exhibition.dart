import 'package:equatable/equatable.dart';

class Exhibition extends Equatable {
  /// The unique identifier of the object
  String id;

  /// The name of the exhibition
  String name;

  /// The description of the exhibition
  String description;

  /// URL to the photo of the exhibition
  List<String> photos;

  /// The registered votes for the exhibition,
  /// each vote is mapped to a user
  Map<String, dynamic> votes;

  /// Constructs the object with a required [id] argument
  /// and optionally [name], [description], [photoUrl]
  /// and [votes] arguments
  Exhibition(this.id, {String name, String description, List<String> photos, Map<String, dynamic> votes})
      : this.name = name ?? 'Unnamed',
        this.description = description ?? 'No description yet',
        this.photos = photos ?? List<String>(),
        this.votes = votes ?? Map<String, dynamic>();
  
  /// Creates a copy with optional [id], [name], [description],
  /// [photoUrl] and [votes] arguments.
  Exhibition copyWith({String id, String name, String description, List<String> photos, Map<String, dynamic> votes}) {
    return Exhibition(
      id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      photos: photos ?? this.photos,
      votes: votes ?? this.votes
    );
  }

  /// Returns a [String] representation of the object
  @override
  String toString() {
    return 'Exhibition{ id: $id, name: $name, description: $description, photos: $photos, votes: $votes }';
  }

  /// Returns a [Map<String, dynamic>] from the current object
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "photos": photos,
      "votes": votes,
    };
  }

  /// Returns a User object created from the [json] map taken as an argument
  static Exhibition fromJson(Map<String, dynamic> json) {    
    return Exhibition(
      json["id"],
      name: json["name"],
      description: json["description"],
      photos: json["photos"].cast<String>(),
      votes: json["votes"]
    );
  }  
}
