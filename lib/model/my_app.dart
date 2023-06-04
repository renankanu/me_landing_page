class MyApp {
  int id;
  String name;
  String description;
  String image;
  String background;
  int color;
  String googleUrl;

  MyApp({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.background,
    required this.color,
    required this.googleUrl,
  });

  factory MyApp.fromMap(Map<String, dynamic> map) {
    return MyApp(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      background: map['background'] ?? '',
      color: map['color']?.toInt() ?? 0,
      googleUrl: map['google_url'] ?? '',
    );
  }
}
