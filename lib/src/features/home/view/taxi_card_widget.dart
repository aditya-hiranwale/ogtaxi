import 'package:flutter/material.dart';

class TaxiCard extends StatelessWidget {
  final String imageUrl;
  final String taxiName;
  final bool isAvailable;
  final String taxiType;
  final String startLoc;
  final String endLoc;
  final double pricePerKm;
  final double rating;

  const TaxiCard({
    super.key,
    required this.imageUrl,
    required this.taxiName,
    required this.isAvailable,
    required this.taxiType,
    required this.startLoc,
    required this.endLoc,
    required this.pricePerKm,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      color: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(imageUrl,
                  height: 80, width: 80, fit: BoxFit.cover),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(taxiName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  // Taxi Type, Start Location, End Location
                  Text('$taxiType • $startLoc to $endLoc',
                      style: TextStyle(color: Colors.grey[600])),
                  Text('₹${pricePerKm.toStringAsFixed(2)} per km',
                      style: const TextStyle(color: Colors.green)),
                ],
              ),
            ),
            AvailabilityBadge(isAvailable: isAvailable),
          ],
        ),
      ),
    );
  }
}

class AvailabilityBadge extends StatelessWidget {
  final bool isAvailable;

  const AvailabilityBadge({super.key, required this.isAvailable});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: isAvailable ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        isAvailable ? 'Available' : 'In Service',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
