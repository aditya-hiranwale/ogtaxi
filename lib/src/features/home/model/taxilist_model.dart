class TaxiListModel {
  final String taxiId;
  final String taxiName;
  final String taxiDriverName;
  final String taxiType; // Reference to TaxiTypeModel (String path)
  final String taxiImg;
  final String startLoc; // Reference to LocationModel (String path)
  final String endLoc; // Reference to LocationModel (String path)
  final double pricePerKm;
  final bool isAvailable;
  final bool isActive;
  final bool isDeleted;
  final List<String> images;

  TaxiListModel({
    required this.taxiId,
    required this.taxiName,
    required this.taxiDriverName,
    required this.taxiType,
    required this.taxiImg,
    required this.startLoc,
    required this.endLoc,
    required this.pricePerKm,
    required this.isAvailable,
    required this.isActive,
    required this.isDeleted,
    required this.images,
  });

  factory TaxiListModel.fromJson(Map<String, dynamic>? json, String id) {
    if (json == null) {
      return TaxiListModel.empty();
    }
    return TaxiListModel(
      taxiId: id,
      taxiName: json['taxiName'] ?? '',
      taxiDriverName: json['taxiDriverName'] ?? '',
      taxiType: json['taxiType'] ?? '',
      taxiImg: json['taxiImg'] ?? '',
      startLoc: json['startLoc'] ?? '',
      endLoc: json['endLoc'] ?? '',
      pricePerKm: double.parse(json['pricePerKm'] ?? "0"),
      isAvailable: json['isAvailable'] ?? false,
      isActive: json['isActive'] ?? false,
      isDeleted: json['isDeleted'] ?? false,
      images: List<String>.from(json['images'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'taxiName': taxiName,
      'taxiDriverName': taxiDriverName,
      'taxiType': taxiType,
      'taxiImg': taxiImg,
      'startLoc': startLoc,
      'endLoc': endLoc,
      'pricePerKm': pricePerKm,
      'isAvailable': isAvailable,
      'isActive': isActive,
      'isDeleted': isDeleted,
      'images': images,
    };
  }

  static TaxiListModel empty() {
    return TaxiListModel(
      taxiId: '',
      taxiName: '',
      taxiDriverName: '',
      taxiType: '',
      taxiImg: '',
      startLoc: '',
      endLoc: '',
      pricePerKm: 0.0,
      isAvailable: false,
      isActive: false,
      isDeleted: true,
      images: [],
    );
  }
}
