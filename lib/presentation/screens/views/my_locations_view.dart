import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../domain/entities/current_conditon.dart';
import '../../widgets/widgets.dart';

class MyLocationsView extends StatelessWidget {
  const MyLocationsView({super.key});

  @override
  Widget build(BuildContext context) {
  List<CurrentCondition> currentConditions = [];


    return (currentConditions.isNotEmpty) ? const _BlankList() : 
    ListView(
          padding: const EdgeInsets.all(8.0),
          children: const [
            CityCard(
              cityName: 'Miami',
              description: 'This is my favorite city.',
              time: '11:00 AM',
              icon: Icons.wb_sunny,
            ),
            // Puedes agregar más CityCard aquí si lo deseas
          ],
        );
  }
}

class _BlankList extends StatelessWidget {
  const _BlankList();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/1.svg',
            width: 100,
            height: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'No data found',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
          ),
          const Text('Please add a city to track it is weather')
        ],
      ),
    );
  }
}
