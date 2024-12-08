import 'package:flutter/material.dart';

class TaxiCard extends StatelessWidget {
  final String imageUrl;
  final String taxiName;
  final bool isAvailable;
  final String taxiType;
  final String location;
  final double pricePerKm;

  const TaxiCard({
    super.key,
    required this.imageUrl,
    required this.taxiName,
    required this.isAvailable,
    required this.taxiType,
    required this.location,
    required this.pricePerKm,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
                  Text('$taxiType • $location',
                      style: TextStyle(color: Colors.grey[600])),
                  Text('₹${pricePerKm.toStringAsFixed(2)} per km',
                      style: const TextStyle(color: Colors.green)),
                ],
              ),
            ),
            Icon(isAvailable ? Icons.check_circle : Icons.cancel,
                color: isAvailable ? Colors.green : Colors.red),
          ],
        ),
      ),
    );
  }
}
