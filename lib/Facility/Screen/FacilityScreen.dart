import 'package:flutter/material.dart';
import '../Widgets/Data/FacilityList.dart';
import '../Widgets/FacilityDocumentList.dart';
import '../Widgets/FacilityFilterButtons.dart';
import '../Widgets/FacilitySearchBar.dart';
import '../Widgets/FacilityAppBar.dart';

class FacilityScreen extends StatefulWidget {
  const FacilityScreen({super.key});

  @override
  State<FacilityScreen> createState() => _FacilityScreenState();
}

class _FacilityScreenState extends State<FacilityScreen> {
  int selectedFilter = 0;
  final filters = ['All', 'Hospital', 'Clinic', 'Pharmacy']; // match type string
  final TextEditingController _searchController = TextEditingController();
  String searchText = '';

  List<Map<String, dynamic>> get filteredFacilities {
    final query = searchText.toLowerCase();

    return facilities.where((facility) {
      final matchesFilter = selectedFilter == 0
          ? true
          : facility['type'] == filters[selectedFilter]; // <- filter by type

      final matchesSearch = (facility['name'] as String)
          .toLowerCase()
          .contains(query) ||
          (facility['type'] as String).toLowerCase().contains(query) ||
          (facility['address'] as String).toLowerCase().contains(query);

      return matchesFilter && matchesSearch;
    }).toList()
      ..sort((a, b) => (a['name'] as String).compareTo(b['name'] as String));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: FacilityAppBar(addDocument: (_) {}),
      body: Column(
        children: [
          const SizedBox(height: 10),
          FacilitySearchBar(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                searchText = value; // save search text
              });
            },
          ),
          const SizedBox(height: 5),
          FacilityFilterBar(
            filters: filters,
            selectedFilter: selectedFilter,
            onFilterSelected: (index) {
              setState(() {
                selectedFilter = index; // filter list by type
              });
            },
          ),
          const SizedBox(height: 10),
          FacilityListView(
            facilities: filteredFacilities,
          ),
        ],
      ),
    );
  }
}
