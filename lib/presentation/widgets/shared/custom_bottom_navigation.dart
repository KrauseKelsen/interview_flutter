import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  
    const CustomBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      elevation: 0,
      items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
            label: 'Home',
            backgroundColor: colors.primary),
        BottomNavigationBarItem(
            icon: const Icon(Icons.location_on_outlined),
            activeIcon: const Icon(Icons.location_on),
            label: 'My Locations',
            backgroundColor: colors.primary),
        BottomNavigationBarItem(
            icon: const Icon(Icons.settings_outlined),
            activeIcon: const Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: colors.primary),
      ]);
  }
}