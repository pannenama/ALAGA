import 'package:flutter/material.dart';

class FacilityFilterBar extends StatelessWidget {
  final List<String> filters;
  final int selectedFilter;
  final ValueChanged<int> onFilterSelected;

  const FacilityFilterBar({
    super.key,
    required this.filters,
    required this.selectedFilter,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(filters.length, (index) {
            final isSelected = selectedFilter == index;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ElevatedButton(
                onPressed: () => onFilterSelected(index), // triggers parent
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Color(0xFF2E8B57) : Colors.white,
                  side: BorderSide(
                    color: Colors.grey.shade100,
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                child: Text(
                  filters[index],
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
