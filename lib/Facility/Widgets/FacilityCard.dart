import 'package:flutter/material.dart';
import 'package:alaga/Facility/FacilityBottomSheet/BottomSheetPage.dart'; // Import the bottom sheet page

class FacilityCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const FacilityCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Show the bottom sheet when the card is tapped
        _showBottomSheet(context);
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item['name'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      if (item['badge'] != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            item['badge'],
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    runSpacing: -8,
                    children: item['tags']
                        .map<Widget>(
                          (tag) => Chip(
                        label: Text(
                          tag,
                          style: const TextStyle(fontSize: 11),
                        ),
                        backgroundColor: Colors.grey.shade100,
                      ),
                    )
                        .toList(),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item['address'],
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: item['open'] ? Colors.green : Colors.red,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        item['open'] ? 'Open' : 'Closed',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: item['open'] ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  item['distance'],
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 8),
                const Icon(
                  Icons.chevron_right,
                  color: Colors.black45,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (BuildContext context) {
        // Return the FacilityDetailsPage inside the bottom sheet
        return FacilityDetailsPage(facility: item);
      },
    );
  }
}
