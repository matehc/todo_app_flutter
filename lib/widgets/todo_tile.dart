import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final bool isCompleted;
  final String taskName;
  final Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  TodoTile(
      {super.key,
      required this.isCompleted,
      required this.onChanged,
      required this.taskName,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteTask,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(10),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete Task',
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
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
        ),
      ),
    );
  }
}
