import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import '../../data/models/activity.dart';

class ActivityChart extends StatelessWidget {
  final List<Activity> activities;

  ActivityChart({required this.activities});

  @override
  Widget build(BuildContext context) {
    final pointsByDay = <String, int>{};
    activities.forEach((activity) {
      final day = DateFormat('yyyy-MM-dd').format(activity.date);
      pointsByDay[day] = (pointsByDay[day] ?? 0) + activity.points;
    });

    return BarChart(
      BarChartData(
        borderData: FlBorderData(show: false),
        barGroups: pointsByDay.entries.map((entry) {
          return BarChartGroupData(
            x: DateTime.parse(entry.key).weekday,
            barsSpace: 4,
            barRods: [
              BarChartRodData(
                toY: entry.value.toDouble(),
                color: Colors.blue,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
