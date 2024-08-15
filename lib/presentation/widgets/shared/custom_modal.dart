import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/city.dart';
import '../../providers/providers.dart';
import '../widgets.dart';

class CustomModal extends ConsumerStatefulWidget {
  final Function(String cityKey, String cityName, String description) onCitySaved;
  const CustomModal({
    required this.onCitySaved,
    super.key,
  });

  @override
  CustomModalState createState() => CustomModalState();
}

class CustomModalState extends ConsumerState<CustomModal> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _selectedCityKey;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //_descriptionController.dispose();
    //_cityController.dispose();
    super.dispose();
  }

  void onButtomTapped() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        final String selectedCity = _cityController.text;
        final String description = _descriptionController.text;

        print('Selected City: $selectedCity');
        print('City Key: $_selectedCityKey');
        print('Description: $description');

        widget.onCitySaved(_selectedCityKey ?? "", selectedCity, description);
        
        Navigator.pop(context);
      });
    } else {
      setState(() {
        null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 30), // Espacio entre la línea y el campo Add City
            _CityFormField(
              cityController: _cityController,
              onCitySelected: (key) {
                setState(() {
                  _selectedCityKey = key;
                });
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
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

class _CityFormField extends ConsumerStatefulWidget {
  final TextEditingController cityController;
  final ValueChanged<String> onCitySelected;

  const _CityFormField({
    required this.cityController,
    required this.onCitySelected,
  });

  @override
  CityFormFieldState createState() => CityFormFieldState();
}

class CityFormFieldState extends ConsumerState<_CityFormField> {
  late TextEditingController _controller;
  List<City> cities = [];
  Timer? _debounce;
  String? _selectedCityKey;

  @override
  void initState() {
    super.initState();
    _controller = widget.cityController;
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      // Aquí es donde realizamos la búsqueda
      setState(() {
        cities.clear();
        if (value.isNotEmpty) {
          ref.read(getCitiesProvider.notifier).loadNextSearch(value);
          print(value);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    cities = ref.watch(getCitiesProvider);
    return Column(
      children: [
        TextFormField(
          controller: _controller,
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
          onChanged: _onSearchChanged,
        ),
        if (cities.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey[200],
            ),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: cities.length,
                itemBuilder: (context, index) {
                  final city = cities[index];
                  return ListTile(
                    title: Text(city.localizedName),
                    onTap: () {
                      _controller.text = city.localizedName;
                      setState(() {
                        cities.clear();
                        _selectedCityKey = city.key;
                      });
                      widget.onCitySelected(_selectedCityKey!);
                    },
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}