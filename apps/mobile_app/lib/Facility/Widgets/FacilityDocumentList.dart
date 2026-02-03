import 'package:flutter/material.dart';
import 'FacilityCard.dart';

class FacilityListView extends StatelessWidget {
  final List<Map<String, dynamic>> facilities;

  const FacilityListView({
    super.key,
    required this.facilities,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: List.generate(facilities.length, (index) {
                final item = facilities[index];

                return Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: FacilityCard(item: item),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
