import 'package:alaga/Document/Widget/InsideDocument/AppBar/Tabs.dart';
import 'package:flutter/material.dart';

class MetaDataCard extends StatelessWidget {
  const MetaDataCard({super.key});

  Widget _infoCard(String title, String value) {
    return Container(
      // Remove fixed width to allow Expanded to control sizing
      height: 75,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 11, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w600),
            overflow: TextOverflow.ellipsis, // prevents overflow
            softWrap: true,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TabsRow(selectedIndex: 2),
          const SizedBox(height: 20),
          Column(
            children: [
              Row(
                children: [
                  Expanded(child: _infoCard("ISSUER", "St. Luke's Medical")),
                  const SizedBox(width: 12),
                  Expanded(child: _infoCard("UPLOADED BY", "Dr. Maria Santos")),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _infoCard("SYNC STATUS", "Synced")),
                  const SizedBox(width: 12),
                  Expanded(child: _infoCard("VERIFIED BY", "St. Luke's Admin")),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.share, color: Colors.white),
              label: const Text(
                'Share Document',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D1B2A),
                foregroundColor: Colors.white, // ensures icon/text are white
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
