import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/city.dart';
import 'cities_repository_provider.dart';

final getCitiesProvider = StateNotifierProvider<CitiesNotifier, List<City>>((ref) {

  final fetchMoreCities = ref.watch( cityRepositoryProvider ).getCities;

  return CitiesNotifier(fetchMoreCities: fetchMoreCities);
});

typedef CityCallback = Future<List<City>> Function(String query);

class CitiesNotifier extends StateNotifier<List<City>> {
  CityCallback fetchMoreCities;

  CitiesNotifier({required this.fetchMoreCities}) : super([]);

  Future<void> loadNextSearch(String query) async {
    final List<City> cities = await fetchMoreCities(query);
    state = [...state, ...cities];
  }
}
