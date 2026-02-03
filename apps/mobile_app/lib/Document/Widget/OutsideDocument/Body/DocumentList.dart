import 'package:flutter/material.dart';
import '../BottomSheet/ListBottomSheet.dart';

class DocumentList extends StatelessWidget {
  final List<Map<String, dynamic>> documents;
  final void Function(Map<String, dynamic>)? onTapDocument;

  const DocumentList({
    super.key,
    required this.documents,
    this.onTapDocument,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: documents.isEmpty
          ? const Center(
        child: Text(
          '(No Documents)',
          style: TextStyle(fontSize: 25, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: documents.length,
        itemBuilder: (context, index) {
          final doc = documents[index];

          return Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: InkWell(
              onTap: () {
                listBottomSheet(context);
                if (onTapDocument != null) {
                  onTapDocument!(doc);
                }
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(12),
                height: 100,
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
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor:
                      (doc['color'] as Color).withValues(alpha: 0.15),
                      child: Icon(
                        Icons.description,
                        size: 40,
                        color: doc['color'],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            doc['title'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            doc['facility'],
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            doc['meta'],
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

//
// 🔹 PRESET DOCUMENT LIST (from the image)
//
final List<Map<String, dynamic>> presetDocuments = [
  {
    'title': 'Amoxicillin 500mg',
    'facility': 'Bicol Regional Hospital',
    'meta': 'Lab Result • 2023-10-25',
    'color': Colors.green,
  },
  {
    'title': 'Complete Blood Count',
    'facility': 'City Health Office',
    'meta': 'Lab Result • 2023-10-24',
    'color': Colors.orange,
  },
  {
    'title': 'Chest X-Ray PA View',
    'facility': 'Diagnostic Plus',
    'meta': 'Imaging • 2023-10-20',
    'color': Colors.red,
  },
  {
    'title': 'Losartan 50mg',
    'facility': 'Barangay Health Center',
    'meta': 'Prescription • 2023-09-15',
    'color': Colors.blue,
  },
];
