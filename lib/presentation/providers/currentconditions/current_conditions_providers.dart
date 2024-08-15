import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/current_conditon.dart';
import 'current_conditions_repository_provider.dart';


final getCurrentConditionsProvider = StateNotifierProvider<CurrentConditionsNotifier, List<CurrentCondition>>((ref) {

  final fetchCurrentConditions = ref.watch( currentConditionRepositoryProvider ).getCurrentConditions;

  return CurrentConditionsNotifier(fetchCurrentConditions: fetchCurrentConditions);
});

typedef CurrentConditionCallback = Future<List<CurrentCondition>> Function(String query);

class CurrentConditionsNotifier extends StateNotifier<List<CurrentCondition>> {
  CurrentConditionCallback fetchCurrentConditions;

  CurrentConditionsNotifier({required this.fetchCurrentConditions}) : super([]);

  Future<void> getCurrentConditions(String key) async {
    final List<CurrentCondition> currentConditions = await fetchCurrentConditions(key);
    state = [...state, ...currentConditions];
  }
}
