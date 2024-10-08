import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CustomBlankList extends StatelessWidget {
  const CustomBlankList({super.key});

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