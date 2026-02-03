import 'package:flutter/material.dart';
import '../../config/app_colors.dart';
import '../qr_id/qr_id_screen.dart';
import '../../services/profile_store.dart';
import 'hp_news.dart';

class HomePage extends StatefulWidget {
  final ValueChanged<int> onNavigate;

  const HomePage({
    super.key,
    required this.onNavigate,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _newsScrollController = ScrollController();
  Map<String, String>? profile;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final p = await ProfileStore.getProfile();
    if (!mounted) return;
    setState(() => profile = p);
  }

  @override
  void dispose() {
    _newsScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final p = profile;
    final firstName = (p?["firstName"] ?? "Juan");
    final lastName = (p?["lastName"] ?? "Dela Cruz");

    return SafeArea(
      child: Column(
        children: [
          // ==================== HEADER (fixed) ====================
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 16,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello, $firstName $lastName!',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Your health ID is active.',
                              style: TextStyle(
                                color: Color(0xFF6B7280),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),

                      Row(
                        children: [
                          _HeaderIconButton(
                            icon: Icons.help_outline,
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Help (demo)")),
                              );
                            },
                          ),
                          const SizedBox(width: 10),

                          // ✅ GO TO SETTINGS TAB INSTEAD OF PUSHING A NEW PAGE
                          _HeaderIconButton(
                            icon: Icons.person_outline,
                            onTap: () => widget.onNavigate(3),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // Buttons row
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 44,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const QrIdScreen(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.qr_code_2, size: 18),
                            label: const Text('Show QR ID'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0B1220),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SizedBox(
                          height: 44,
                          child: OutlinedButton(
                            // ✅ SWITCH TAB (no push)
                            onPressed: () => widget.onNavigate(3),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.primary,
                              backgroundColor: const Color(0xFFEAF7F0),
                              side: const BorderSide(
                                color: Color(0xFFBFE3D0),
                                width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'View Profile',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // ==================== SCROLLABLE AREA ====================
          Expanded(
            child: NewsSection(
              controller: _newsScrollController,
            ),
          ),
        ],
      ),
    );
  }
}

// =======================================================
// Small icon buttons (top-right of header)
// =======================================================
class _HeaderIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _HeaderIconButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: const Color(0xFFEAF7F0),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFBFE3D0)),
        ),
        child: Icon(
          icon,
          size: 18,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
