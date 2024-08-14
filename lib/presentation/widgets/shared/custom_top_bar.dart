import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.black,
        title: Row(children: [
          SvgPicture.asset(
            'assets/2.svg',
            width: 30,
            height: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text('WeatherForemost',
              style: TextStyle(color: Colors.white)),
        ]));
  }
}
