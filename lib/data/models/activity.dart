import 'package:hive/hive.dart';

part 'activity.g.dart';

@HiveType(typeId: 0)
class Activity {
  @HiveField(0)
  final DateTime date;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final int points;

  Activity({
    required this.date,
    required this.description,
    required this.points,
  });
}
