import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_flutter/presentation/providers/providers.dart';
import 'package:interview_flutter/presentation/screens/views/settings_view.dart';
import '../../domain/entities/city_condition.dart';
import '../../domain/entities/current_conditon.dart';
import '../../infrastructure/mappers/citycondition_mapper.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  List<CurrentCondition> currentConditions = [];
  List<CityCondition> cityConditions = [];

  int selectedIndex = 0;
  String cityKey = "";
  String cityName = "";
  String description = "";

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _addCityCondition(
      String pcityKey, String pcityName, String pdescription) {
    setState(() {
      cityKey = pcityKey;
      cityName = pcityName;
      description = pdescription;
      print('Selected City: $cityName');
      print('City Key: $cityKey');
      print('Description: $description');

      if (cityKey != "") {
        ref
            .read(getCurrentConditionsProvider.notifier)
            .getCurrentConditions(cityKey);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    //currentConditions = ref.watch(getCurrentConditionsProvider);
  }

  @override
  void dispose() {
    super.dispose();
  }

  CityCondition mapCurrentConditionsToCityConditions(
      List<CurrentCondition> currentCondition,
      String key,
      String city,
      String description) {
    CityCondition cityConditions = CityConditionMapper.cityConditionDBToEntity(
      currentCondition.first,
      key,
      city,
      description,
    );

    return cityConditions;
  }

  @override
  Widget build(BuildContext context) {
    currentConditions = ref.watch(getCurrentConditionsProvider);
    
    if(currentConditions.isNotEmpty){
      cityConditions.add(mapCurrentConditionsToCityConditions(currentConditions, cityKey, cityName, description));
    }

    final colors = Theme.of(context).colorScheme;
    final views = [
      const HomeView(),
      MyLocationsView(cityConditions),
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
        return CustomModal(
          onCitySaved: _addCityCondition, // Pasa el callback aquí
        );
      },
    );
  }
}
