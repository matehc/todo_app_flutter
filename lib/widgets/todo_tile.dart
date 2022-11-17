import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final bool isCompleted;
  final String taskName;
  final Function(bool?)? onChanged;

  TodoTile({
    super.key,
    required this.isCompleted,
    required this.onChanged,
    required this.taskName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
      child: Row(
        children: [
          Checkbox(value: isCompleted, onChanged: onChanged),
          Text(
            taskName,
            style: isCompleted
                ? const TextStyle(decoration: TextDecoration.lineThrough)
                : const TextStyle(decoration: TextDecoration.none),
          )
        ],
      ),
    );
  }
}
