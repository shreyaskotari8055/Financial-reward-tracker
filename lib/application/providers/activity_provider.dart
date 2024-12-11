import 'package:riverpod/riverpod.dart';

import '../../data/models/activity.dart';
import '../../domain/usecase/reward_usecases.dart';

final activityProvider = StateNotifierProvider<ActivityNotifier, List<Activity>>((ref) {
  return ActivityNotifier(ref);
});

class ActivityNotifier extends StateNotifier<List<Activity>> {
  final Ref _ref;

  ActivityNotifier(this._ref) : super([]);

  void addActivity(Activity activity) {
    state = [...state, activity];
  }

  int getTotalPoints() {
    final totalPointsUseCase = CalculateTotalPoints();
    return totalPointsUseCase.execute(state);
  }

  int getBonusPoints() {
    final bonusPointsUseCase = CheckBonusPoints();
    return bonusPointsUseCase.execute(state);
  }
}
