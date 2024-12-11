import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/providers/activity_provider.dart';
import '../../data/models/activity.dart';

class ActivityDialog extends ConsumerStatefulWidget {
  @override
  _ActivityDialogState createState() => _ActivityDialogState();
}

class _ActivityDialogState extends ConsumerState<ActivityDialog> {
  final _descriptionController = TextEditingController();

  void _logActivity() {
    final description = _descriptionController.text;
    if (description.isEmpty) return;

    final activity = Activity(
      date: DateTime.now(),
      description: description,
      points: 10, // Default points per activity
    );

    ref.read(activityProvider.notifier).addActivity(activity);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Log New Activity'),
      content: TextField(
        controller: _descriptionController,
        decoration: InputDecoration(hintText: 'Enter activity description'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _logActivity,
          child: Text('Save Activity'),
        ),
      ],
    );
  }
}
