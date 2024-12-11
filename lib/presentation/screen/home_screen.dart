import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/providers/activity_provider.dart';
import '../widget/activity_chart.dart';
import '../widget/activity_dialog.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activities = ref.watch(activityProvider);
    final totalPoints = ref.watch(activityProvider.notifier).getTotalPoints();
    final bonusPoints = ref.watch(activityProvider.notifier).getBonusPoints();

    return Scaffold(
      appBar: AppBar(title: Text('Financial Reward Tracker')),
      body: Column(
        children: [
          Text('Total Points: $totalPoints'),
          Text('Bonus Points: $bonusPoints'),
          SizedBox(height: 20),
          ActivityChart(activities: activities),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => ActivityDialog(),
            ),
            child: Text('Log New Activity'),
          ),
        ],
      ),
    );
  }
}
