import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  // Demo-ish colors
  static const Color activeColor = Color(0xFF2E8B57);
  static const Color inactiveColor = Color(0xFF9CA3AF);
  static const Color backgroundColor = Colors.white;
  static const Color topBorderColor = Color(0xFFE5E7EB);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: backgroundColor,
      elevation: 0,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      clipBehavior: Clip.antiAlias,
      child: SafeArea(
        top: false,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: topBorderColor, width: 1),
            ),
          ),
          height: 70, // keep the "working" height
          child: Row(
            children: [
              Expanded(
                child: _NavItem(
                  icon: Icons.home_outlined,
                  activeIcon: Icons.home,
                  label: 'Home',
                  index: 0,
                  currentIndex: currentIndex,
                  onTap: onTap,
                ),
              ),
              Expanded(
                child: _NavItem(
                  icon: Icons.description_outlined,
                  activeIcon: Icons.description,
                  label: 'Docs',
                  index: 1,
                  currentIndex: currentIndex,
                  onTap: onTap,
                ),
              ),

              const SizedBox(width: 56), // space for FAB

              Expanded(
                child: _NavItem(
                  icon: Icons.location_on_outlined,
                  activeIcon: Icons.location_on,
                  label: 'Facilities',
                  index: 2,
                  currentIndex: currentIndex,
                  onTap: onTap,
                ),
              ),
              Expanded(
                child: _NavItem(
                  icon: Icons.settings_outlined,
                  activeIcon: Icons.settings,
                  label: 'Settings',
                  index: 3,
                  currentIndex: currentIndex,
                  onTap: onTap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final int index;
  final int currentIndex;
  final Function(int) onTap;

  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = index == currentIndex;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => onTap(index),
      child: Padding(
        // IMPORTANT: small padding only (prevents overflow)
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              size: 26, // closer to demo
              color: isActive ? NavBar.activeColor : NavBar.inactiveColor,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                height: 1.0,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
                color: isActive ? NavBar.activeColor : NavBar.inactiveColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
