import 'package:flutter/material.dart';
import 'package:interview_flutter/presentation/screens/views/settings_view.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final views = [
      const HomeView(),
      const MyLocationsView(),
      const SettingsView(),
    ];

    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60.0), child: CustomTopBar()),
      body: IndexedStack(
        index: selectedIndex,
        children: views,
      ),
      bottomNavigationBar: CustomBottomNavigation(
          selectedIndex: selectedIndex, onItemTapped: _onItemTapped),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModal(context);
        },
        child: Icon(Icons.add, color: colors.primary),
      ),
    );
  }

  Future<dynamic> showModal(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return const CustomModal();
      },
    );
  }
}


