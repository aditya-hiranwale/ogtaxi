class LocationModel {
  final String locationId;
  final String locName;
  final bool isActive;
  final bool isDeleted;

  LocationModel({
    required this.locationId,
    required this.locName,
    required this.isActive,
    required this.isDeleted,
  });

  // Factory method to handle null document
  factory LocationModel.fromJson(Map<String, dynamic>? json, String id) {
    if (json == null) {
      return LocationModel.empty();
    }
    return LocationModel(
      locationId: id,
      locName: json['locName'] ?? '',
      isActive: json['isActive'] ?? false,
      isDeleted: json['isDeleted'] ?? false,
    );
  }

  // Converts object to JSON
  Map<String, dynamic> toJson() {
    return {
      'locName': locName,
      'isActive': isActive,
      'isDeleted': isDeleted,
    };
  }

  // Empty method
  static LocationModel empty() {
    return LocationModel(
      locationId: '',
      locName: '',
      isActive: false,
      isDeleted: true,
    );
  }
}
