import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolite/models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function(int status)? onStatusChanged;

  TaskItem({required this.task, this.onStatusChanged,});

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      finalPadding: const EdgeInsets.all(8.0),
      title: Text('${task.title}'),
      trailing: IconButton(
        icon: Icon(
          task.status == Task.DOING_STATUS
              ? Icons.check_circle_outline
              : Icons.check_circle,
        ),
        color: Colors.green,
        onPressed: _onPressed,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0,),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${task.description}',
            ),
          ),
        ),
      ],
    );
  }

  _onPressed() {
    if (null != onStatusChanged) {
      onStatusChanged!(
          task.status == Task.DOING_STATUS ? Task.DONE_STATUS : Task.DOING_STATUS
      );
    }
  }

}