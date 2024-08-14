import 'package:flutter/material.dart';
import 'package:interview_flutter/presentation/delegates/search_city_delegate.dart';

class CustomModal extends StatefulWidget {
  const CustomModal({
    super.key,
  });

  @override
  State<CustomModal> createState() => _CustomModalState();
}

class _CustomModalState extends State<CustomModal> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void onButtomTapped() {
      if (_formKey.currentState!.validate()) {
        setState(() {
          // Aquí puedes añadir la lógica para guardar la ciudad.
          Navigator.pop(context);
        });
      } else {
        setState(() {
          null;
        });
      }
    }

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Línea gris superior
            Container(
              width: 60,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
            const SizedBox(
                height: 30), // Espacio entre la línea y el campo Add City
            TextFormField(
              onChanged: (value) {
                showSearch(
                  context: context, 
                  delegate: SearchCityDelegate()
                );
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some valid city.';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Add City',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              onChanged: ((value) {
                showSearch(context: context, delegate: SearchCityDelegate());
              }),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some description.';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 24),
            CustomButtom(onButtomTapped: onButtomTapped),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

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
