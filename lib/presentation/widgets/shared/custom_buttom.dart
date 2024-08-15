import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final void Function() onButtomTapped;

  const CustomButtom({
    super.key,
    required this.onButtomTapped,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return FilledButton(
      onPressed: onButtomTapped,
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.primary, // Cambia el color aquí
        minimumSize: const Size(double.infinity, 50), // Ancho completo
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Text(
        'Save City',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
