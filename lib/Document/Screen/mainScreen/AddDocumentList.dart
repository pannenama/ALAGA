import 'package:flutter/material.dart';

class AddDocumentScreen extends StatefulWidget {
  const AddDocumentScreen({super.key});

  @override
  State<AddDocumentScreen> createState() => _AddDocumentScreenState();
}

class _AddDocumentScreenState extends State<AddDocumentScreen> {
  final titleController = TextEditingController();
  final facilityController = TextEditingController();
  final metaController = TextEditingController();
  final buttonNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Document')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: facilityController,
              decoration: const InputDecoration(labelText: 'Facility'),
            ),
            TextField(
              controller: metaController,
              decoration: const InputDecoration(labelText: 'Meta'),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              child: Text(
                buttonNameController.text.isEmpty
                    ? 'Add Document'
                    : buttonNameController.text,
              ),
              onPressed: () {
                Navigator.pop(context, {
                  'title': titleController.text,
                  'facility': facilityController.text,
                  'meta': metaController.text,
                  'color': Colors.blue,
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
