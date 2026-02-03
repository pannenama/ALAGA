import 'package:flutter/material.dart';

class FacilityDetailsPage extends StatelessWidget {
  final Map<String, dynamic> facility;

  const FacilityDetailsPage({super.key, required this.facility});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: SafeArea(
        top: false,
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top drag handle
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(top: 8, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),

                // Facility name
                Text(
                  facility['name'] ?? 'Unknown Facility',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),

                // Facility address
                Text(
                  facility['address'] ?? 'Address not available',
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 12),

                // Contact and hours row
                Row(
                  children: [
                    Expanded(
                      child: _buildContactBox(
                        icon: Icons.phone,
                        contact: facility['contact'] ?? 'Not available',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildHoursBox(
                        icon: Icons.access_time,
                        label: 'Hours',
                        hours: facility['hours'] ?? 'Not available',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Tags
                const Text(
                  'Tags:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: _buildTagChips()),
                ),
                const SizedBox(height: 12),

                // Services
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: _buildServiceChips()),
                ),
                const SizedBox(height: 24),

                // Buttons row
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.directions, color: Colors.white),
                        label: const Text("Directions", style: TextStyle(color: Colors.white, fontSize: 20)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2E8B57),
                          minimumSize: const Size.fromHeight(60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.call, color: Colors.white),
                        label: const Text("Call", style: TextStyle(color: Colors.white, fontSize: 20)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2E8B57),
                          minimumSize: const Size.fromHeight(60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactBox({
    required IconData icon,
    required String contact,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF2E8B57)),
          const SizedBox(width: 8),
          Expanded( // ✅ Prevent overflow
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Contact'),
                const SizedBox(height: 4),
                Text(
                  contact,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHoursBox({
    required IconData icon,
    required String label,
    required String hours,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF2E8B57)),
          const SizedBox(width: 8),
          Expanded( // ✅ Prevent overflow
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label),
                const SizedBox(height: 4),
                Text(
                  hours,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildServiceChips() {
    final services = facility['services'] ?? [];
    return services.map<Widget>((service) {
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Chip(
          label: Text(service ?? 'Service'),
          backgroundColor: Colors.blue.shade100,
        ),
      );
    }).toList();
  }

  List<Widget> _buildTagChips() {
    final tags = facility['tags'] ?? [];
    return tags.map<Widget>((tag) {
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Chip(
          label: Text(tag ?? 'Tag'),
          backgroundColor: Colors.grey.shade300,
        ),
      );
    }).toList();
  }
}
