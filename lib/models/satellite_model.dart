class SatelliteModel {
  final int id;
  final String name;
  final String price;
  final String description;
  final String timeInOrbit;
  final String imageKey;

  SatelliteModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.timeInOrbit,
    required this.imageKey,
  });

  String get fullAssetPath => 'assets/images/$imageKey';

  factory SatelliteModel.fromJson(Map<String, dynamic> json) {
    return SatelliteModel(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      name: json['name'] ?? 'Unknown',
      price: json['price'] ?? 'N/A',
      description: json['description'] ?? '',
      timeInOrbit: json['time_in_orbit'] ?? '',
      imageKey: json['image_key'] ?? 'placeholder',
    );
  }
}
