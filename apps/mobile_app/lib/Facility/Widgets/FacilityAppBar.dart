import 'package:flutter/material.dart';

class FacilityAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(Map<String, dynamic>) addDocument;

  const FacilityAppBar({super.key, required this.addDocument});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'Facility',
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
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 30,  // Adjust size if needed
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
