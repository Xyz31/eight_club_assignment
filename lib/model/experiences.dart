// experience_model.dart
class Experience {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final String imageUrl;
  final String iconUrl;
  bool isSelected;

  Experience({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.imageUrl,
    required this.iconUrl,
    required this.isSelected,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      id: json['id'],
      name: json['name'],
      tagline: json['tagline'],
      description: json['description'],
      imageUrl: json['image_url'],
      iconUrl: json['icon_url'],
      isSelected: false,
    );
  }
}
