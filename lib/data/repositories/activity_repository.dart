import 'package:hive_flutter/hive_flutter.dart';
import '../models/activity.dart';

class ActivityRepository {
  final Box<Activity> _activityBox;

  ActivityRepository(this._activityBox);

  Future<void> addActivity(Activity activity) async {
    await _activityBox.add(activity);
  }

  List<Activity> getAllActivities() {
    return _activityBox.values.toList();
  }
}
