class BookingDataModel {
  final String bookingId;
  final String userId;
  final String taxiId; // Reference to TaxiListModel (String path)
  final String pickupLocation; // Reference to LocationModel (String path)
  final String dropLocation; // Reference to LocationModel (String path)
  final double distanceKm;
  final double totalPrice;
  final DateTime bookingTime;
  final bool isActive;
  final bool isDeleted;

  BookingDataModel({
    required this.bookingId,
    required this.userId,
    required this.taxiId,
    required this.pickupLocation,
    required this.dropLocation,
    required this.distanceKm,
    required this.totalPrice,
    required this.bookingTime,
    required this.isActive,
    required this.isDeleted,
  });

  factory BookingDataModel.fromJson(Map<String, dynamic>? json, String id) {
    if (json == null) {
      return BookingDataModel.empty();
    }
    return BookingDataModel(
      bookingId: id,
      userId: json['userId'] ?? '',
      taxiId: json['taxiId'] ?? '',
      pickupLocation: json['pickupLocation'] ?? '',
      dropLocation: json['dropLocation'] ?? '',
      distanceKm: (json['distanceKm'] ?? 0).toDouble(),
      totalPrice: (json['totalPrice'] ?? 0).toDouble(),
      bookingTime: (json['bookingTime'])?.toDate() ?? DateTime.now(),
      isActive: json['isActive'] ?? false,
      isDeleted: json['isDeleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'taxiId': taxiId,
      'pickupLocation': pickupLocation,
      'dropLocation': dropLocation,
      'distanceKm': distanceKm,
      'totalPrice': totalPrice,
      'bookingTime': bookingTime,
      'isActive': isActive,
      'isDeleted': isDeleted,
    };
  }

  static BookingDataModel empty() {
    return BookingDataModel(
      bookingId: '',
      userId: '',
      taxiId: '',
      pickupLocation: '',
      dropLocation: '',
      distanceKm: 0.0,
      totalPrice: 0.0,
      bookingTime: DateTime.now(),
      isActive: false,
      isDeleted: true,
    );
  }
}
