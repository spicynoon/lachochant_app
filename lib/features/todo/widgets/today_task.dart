import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lachochant_app/features/todo/widgets/todo_tile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../common/models/task_models.dart';
import '../../../common/utils/constants.dart';
import '../controllers/todo/todo_provider.dart';
import '../pages/update_task.dart';

class TodayTasks extends ConsumerWidget {
  const TodayTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> listData = ref.watch(todoStateProvider);
    String today = ref.read(todoStateProvider.notifier).getToday();
    var todayList = listData
        .where((element) =>
            element.isCompleted == 0 && element.date!.contains(today))
        .toList();
    return ListView.builder(
        itemCount: todayList.length,
        itemBuilder: (context, index) {
          final data = todayList[index];
          bool isCompleted =
              ref.read(todoStateProvider.notifier).getStatus(data);
          dynamic colors =
              ref.read(todoStateProvider.notifier).getRandomColor();
          return TodoTile(
            delete: () {
              ref.read(todoStateProvider.notifier).deleteTodo(data.id ?? 0);
            },
            editWidget: GestureDetector(
                onTap: () {
                  titles = data.title.toString();
                  descs = data.desc.toString();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateTask(
                                id: data.id ?? 0,
                              )));
                },
                child: Icon(MdiIcons.circleEditOutline)),
            title: data.title,
            color: colors,
            description: data.desc,
            start: data.startTime,
            end: data.endTime,
            switcher: Switch(
                value: isCompleted,
                onChanged: (value) {
                  ref.read(todoStateProvider.notifier).markAsCompleted(
                      data.id ?? 0,
                      data.title.toString(),
                      data.desc.toString(),
                      1,
                      data.date.toString(),
                      data.startTime.toString(),
                      data.endTime.toString());
                }),
          );
        });
  }
}
