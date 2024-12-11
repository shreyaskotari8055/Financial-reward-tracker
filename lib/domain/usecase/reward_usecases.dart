import '../../data/models/activity.dart';

class CalculateTotalPoints {
  int execute(List<Activity> activities) {
    return activities.fold(0, (total, activity) => total + activity.points);
  }
}

class CheckBonusPoints {
  int execute(List<Activity> activities) {
    final activitiesByDay = <String, int>{};
    for (var activity in activities) {
      final day = '${activity.date.year}-${activity.date.month}-${activity.date.day}';
      activitiesByDay[day] = (activitiesByDay[day] ?? 0) + 1;
    }
    return activitiesByDay.values.any((count) => count > 3) ? 20 : 0;
  }
}
