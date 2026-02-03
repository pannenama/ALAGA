import 'package:flutter/material.dart';

import '../../../Document/Screen/mainScreen/DocumentScreen.dart';

class DocumentsPage extends StatelessWidget {
  const DocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: DocumentScreen()
    );
  }
}
