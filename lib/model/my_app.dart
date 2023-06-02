import 'dart:convert';

class MyApp {
  int id;
  String name;
  String description;
  String image;

  MyApp({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  factory MyApp.fromMap(Map<String, dynamic> map) {
    return MyApp(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
    );
  }

  factory MyApp.fromJson(String source) => MyApp.fromMap(json.decode(source));
}
