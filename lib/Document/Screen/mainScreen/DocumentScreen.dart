import 'package:flutter/material.dart';
import '../../Widget/OutsideDocument/Body/DocumentList.dart';
import '../../Widget/OutsideDocument/Body/FilterButtons.dart';
import '../../Widget/OutsideDocument/Body/MainAppBar.dart';
import '../../Widget/OutsideDocument/Body/SearchBar.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> documents = [];

  @override
  void initState() {
    super.initState();
    documents = List.from(presetDocuments); // ✅ SHOW PRESET LIST
  }

  List<Map<String, dynamic>> get filteredDocuments {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) return documents;

    return documents.where((doc) {
      return doc['title'].toLowerCase().contains(query) ||
          doc['facility'].toLowerCase().contains(query) ||
          doc['meta'].toLowerCase().contains(query);
    }).toList();
  }

  void addDocument(Map<String, dynamic> newDoc) {
    setState(() {
      documents.add(newDoc);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DocumentAppBar(addDocument: addDocument),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),

            DocumentSearchBar(
              controller: searchController,
              onChanged: (_) => setState(() {}),
            ),

            const SizedBox(height: 5),

            FilterButtons(
              documents: documents,
              onFiltered: (filteredList) {
                setState(() {
                  documents = filteredList;
                });
              },
            ),

            const SizedBox(height: 10),

            Expanded(
              child: DocumentList(documents: filteredDocuments),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
