import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../MainCode/screens/documents/documents_page.dart';
import '../../OutsideDocument/Data/DataStoring.dart';
import 'AppBarContents.dart';

class DocumentAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const DocumentAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          DocumentStore.documents.add({
            'title': 'Health Check',
            'facility': 'St. Lukes',
            'meta': 'Image',
            'color': Colors.blue,
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const DocumentsPage()),
          );
        },
      ),
      title: const DocumentTitle(),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: VerifiedBadge(),
        ),
      ],
    );
  }
}