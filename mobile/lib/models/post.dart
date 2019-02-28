class Post {
  final String title;
  final String adress;
  final String description;
  final String campus;
  final DateTime startDate;
  final DateTime endDate;

  Post({this.title, this.adress, this.description, this.campus, this.startDate, this.endDate});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      adress: json['adress'] ?? '',
      description: json['description'],
      campus: (json['filters'] as List).first['name'],
      startDate: DateTime.tryParse(json['startDateTime']),
      endDate: DateTime.tryParse(json['endDateTime'])
    );
  }
}