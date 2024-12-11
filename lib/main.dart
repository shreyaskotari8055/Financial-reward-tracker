import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:reward_app/presentation/screen/home_screen.dart';

import 'data/models/activity.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ActivityAdapter());
  await Hive.openBox<Activity>('activities');

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Financial Reward Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
