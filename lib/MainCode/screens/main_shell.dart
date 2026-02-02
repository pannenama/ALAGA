import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import 'home/home_page.dart';
import 'documents/documents_page.dart';
import 'facilities/facilities_page.dart';
import 'settings/settings_page.dart';
import 'qr_id/qr_id_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int currentIndex = 0;

  void _setIndex(int i) => setState(() => currentIndex = i);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      body: IndexedStack(
        index: currentIndex,
        children: [
          HomePage(onNavigate: _setIndex), // ✅ this is the key part
          const DocumentsPage(),
          const FacilitiesPage(),
          const SettingsPage(),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButton(
        elevation: 6,
        backgroundColor: Colors.transparent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const QrIdScreen()),
          );
        },
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFF2E8B57),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
          ),
          child: const Icon(Icons.qr_code_2, color: Colors.white, size: 28),
        ),
      ),

      bottomNavigationBar: NavBar(
        currentIndex: currentIndex,
        onTap: _setIndex,
      ),
    );
  }
}
