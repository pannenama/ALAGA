import 'package:alaga/Delete%20Later/Bottom%20sheet%20test.dart';
import 'package:flutter/material.dart';
import '../Document/Widget/OutsideDocument/BottomSheet/DocumentBottomSheet.dart';

class Testmodal extends StatefulWidget {
  const Testmodal({super.key});

  @override
  State<Testmodal> createState() => _TestmodalState();
}

class _TestmodalState extends State<Testmodal> {
  

  // Fake document data (like your reference style)
  List<Map<String, dynamic>> documents = [
    {
      'title': 'Amoxicillin 500mg',
      'facility': 'Dixil Regional Hospital',
      'meta': 'Prescription • 2024-10-15',
      'status': 'Verified',
      'color': Colors.green,
    },
    {
      'title': 'Complete Blood Count',
      'facility': 'City Health Clinic',
      'meta': 'Lab Result • 2024-10-14',
      'status': 'Unverified',
      'color': Colors.orange,
    },
    {
      'title': 'Chest X-Ray PA View',
      'facility': 'Diagnostic Plus',
      'meta': 'Imaging • 2024-10-12',
      'status': 'Local Only',
      'color': Colors.red,
    },
    {
      'title': 'Losartan 50mg',
      'facility': 'Barangay Health Center',
      'meta': 'Prescription • 2024-09-15',
      'status': 'Dispensed',
      'color': Colors.blue,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 40, left: 8, right: 8),
      child: Column(
        children: [

          /// HEADER
          Card(
            color: Colors.white,
            elevation: 0,
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Documents',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    child: const CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => const DocumentBottomSheet(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          /// SEARCH BAR
          Card(
            child: Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search by name, facility...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          /// DOCUMENT LIST
          Expanded(
            child: Card(
              color: Colors.grey[100],
              child: ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {

                  var doc = documents[index];

                  return InkWell(
                    onTap: () {
                      // open document
                    },
                    child: Card(
                      margin: const EdgeInsets.all(8),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [

                            /// ICON
                            CircleAvatar(
                              backgroundColor:
                              doc['color'].withOpacity(0.15),
                              child: Icon(
                                Icons.description,
                                color: doc['color'],
                              ),
                            ),

                            const SizedBox(width: 12),

                            /// TEXT
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    doc['title'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    doc['facility'],
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    doc['meta'],
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            /// STATUS
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color:
                                doc['color'].withOpacity(0.15),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                doc['status'],
                                style: TextStyle(
                                  color: doc['color'],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
