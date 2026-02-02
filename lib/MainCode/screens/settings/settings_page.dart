import 'package:flutter/material.dart';
import '../../config/app_colors.dart';
import '../../services/profile_store.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Map<String, String>? profile;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final p = await ProfileStore.getProfile();
    if (!mounted) return;
    setState(() => profile = p);
  }

  @override
  Widget build(BuildContext context) {
    final p = profile;
    final name = "${p?["firstName"] ?? "Juan"} ${p?["lastName"] ?? "Dela Cruz"}";
    final id = p?["healthId"] ?? "P-2024-8821";

    // Same vibe as your "New to ALAGA?" card
    const Color alagaGreen = Color(0xFF0F7A4A);

    return Column(
      children: [
        // ================= TOP FIXED HEADER =================
        Container(
          height: 230,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: alagaGreen,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(18),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  // Avatar placeholder (no asset dependency)
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.22),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name (white)
                        Text(
                          name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Patient ID bubble (semi-transparent)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.20),
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.18),
                            ),
                          ),
                          child: Text(
                            "PATIENT ID: $id",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // ================= SCROLLABLE SETTINGS =================
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              SettingsGroup(
                title: 'Privacy & Security',
                children: const [
                  SettingsButton(title: 'Biometrics & App Lock'),
                  SettingsButton(title: 'Data access history'),
                  SettingsButton(title: 'Export my data'),
                  SettingsButton(title: 'Clear cache', isDestructive: true),
                ],
              ),
              const SizedBox(height: 16),
              SettingsGroup(
                title: 'Sync Preferences',
                children: const [
                  ToggleButton(title: 'Auto sync data'),
                  ToggleButton(title: 'Sync on Wi-Fi only'),
                ],
              ),
              const SizedBox(height: 16),
              SettingsGroup(
                title: 'Support',
                children: const [
                  SettingsButton(title: 'Help & tutorials'),
                  SettingsButton(title: 'Contact support'),
                  SettingsButton(title: 'About MISMO'),
                ],
              ),
              const SizedBox(height: 32),
              Center(
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Demo: Sign out coming soon.")),
                    );
                  },
                  child: const Text(
                    'Sign out of device',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ================= REUSABLE WIDGETS =================

class SettingsGroup extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsGroup({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  final String title;
  final bool isDestructive;

  const SettingsButton({
    super.key,
    required this.title,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey.shade50,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: isDestructive ? Colors.red : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Demo: '$title' coming soon.")),
          );
        },
      ),
    );
  }
}

class ToggleButton extends StatefulWidget {
  final String title;

  const ToggleButton({super.key, required this.title});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey.shade50,
      margin: const EdgeInsets.only(bottom: 8),
      child: SwitchListTile(
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        value: value,
        onChanged: (v) => setState(() => value = v),
      ),
    );
  }
}
