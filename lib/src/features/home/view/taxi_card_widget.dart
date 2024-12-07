import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
      // margin: const EdgeInsets.symmetric(
      //   vertical: KSizes.k8pad,
      // ),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          // Taxi Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Expanded(
            child: ListTile(
              contentPadding: const EdgeInsets.all(8.0),
              title: Text(
                taxiName,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$taxiType • $location',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '₹${pricePerKm.toStringAsFixed(2)} per km',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              trailing: AvailabilityBadge(isAvailable: isAvailable),
            ),
          ),
        ],
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
        isAvailable ? 'Available' : 'Not Available',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
