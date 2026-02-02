import 'package:flutter/material.dart';

class FilterButtons extends StatefulWidget {
  final List<Map<String, dynamic>> documents; // list to filter
  final ValueChanged<List<Map<String, dynamic>>> onFiltered;

  const FilterButtons({
    super.key,
    required this.documents,
    required this.onFiltered,
  });

  @override
  _FilterButtonsState createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  int _selectedIndex = 0;

  // Filter labels correspond to meta values
  final List<String> _labels = ['All', 'Prescriptions', 'Images', 'Files', 'Medical Certificates'];

  void _filterDocuments(int index) {
    setState(() {
      _selectedIndex = index;
    });

    final selectedLabel = _labels[index];

    List<Map<String, dynamic>> filtered;
    if (selectedLabel == 'All') {
      filtered = widget.documents;
    } else {
      filtered = widget.documents
          .where((doc) =>
      (doc['meta'] as String).toLowerCase() ==
          selectedLabel.toLowerCase())
          .toList();
    }

    widget.onFiltered(filtered);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(_labels.length, (index) {
            final isSelected = _selectedIndex == index;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ElevatedButton(
                onPressed: () => _filterDocuments(index),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Color(0xFF2E8B57): Colors.white,
                  side: BorderSide(
                    color: Colors.grey.shade100,
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text(
                  _labels[index],
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
