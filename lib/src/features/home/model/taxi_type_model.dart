class TaxiTypeModel {
  final String typeId;
  final String type;
  final double basePricePerKm;
  final bool isActive;
  final bool isDeleted;

  TaxiTypeModel({
    required this.typeId,
    required this.type,
    required this.basePricePerKm,
    required this.isActive,
    required this.isDeleted,
  });

  factory TaxiTypeModel.fromJson(Map<String, dynamic>? json, String id) {
    if (json == null) {
      return TaxiTypeModel.empty();
    }
    return TaxiTypeModel(
      typeId: id,
      type: json['type'] ?? '',
      basePricePerKm: double.parse(json['basePricePerKm'] ?? "0"),
      isActive: json['isActive'] ?? false,
      isDeleted: json['isDeleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'basePricePerKm': basePricePerKm,
      'isActive': isActive,
      'isDeleted': isDeleted,
    };
  }

  static TaxiTypeModel empty() {
    return TaxiTypeModel(
      typeId: '',
      type: '',
      basePricePerKm: 0.0,
      isActive: false,
      isDeleted: true,
    );
  }
}
