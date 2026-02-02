import 'package:alaga/Document/Widget/OutsideDocument/BottomSheet/DocumentBottomSheet.dart';
import 'package:flutter/material.dart';

class DocumentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(Map<String, dynamic>) addDocument;

  const DocumentAppBar({super.key, required this.addDocument});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'Documents',
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: InkWell(
            onTap: () async {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => const DocumentBottomSheet(),
              );
            },
            child: const CircleAvatar(
              backgroundColor: Color(0xFF2E8B57),
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
