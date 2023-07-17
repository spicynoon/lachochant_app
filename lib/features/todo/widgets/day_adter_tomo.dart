import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lachochant_app/features/todo/controllers/todo/todo_provider.dart';
import 'package:lachochant_app/features/todo/widgets/todo_tile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../common/utils/constants.dart';
import '../../../common/widgets/xpansion_tile.dart';
import '../controllers/xpansion_provider.dart';
import '../pages/update_task.dart';

class DayAfterTomo extends ConsumerWidget {
  const DayAfterTomo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoStateProvider);
    var colors = ref.read(todoStateProvider.notifier).getRandomColor();
    String dayAfterTomo =
        ref.read(todoStateProvider.notifier).getDayAfterTomo();
    var tomorrowTasks = todos.where(
      (element) => element.date!.contains(dayAfterTomo),
    );

    return XpansionTile(
        text: DateTime.now()
            .add(const Duration(days: 2))
            .toString()
            .substring(5, 10),
        text2: "Task are shown here",
        onExpansionChanged: (bool expanded) {
          ref.read(xpansionStateProvider.notifier).setStart(!expanded);
        },
        trailing: Padding(
          padding: EdgeInsets.only(right: 12.0.w),
          child: ref.watch(xpansionStateProvider)
              ? Icon(
                  MdiIcons.arrowDownDropCircle,
                  color: AppConst.kLight,
                )
              : Icon(
                  MdiIcons.arrowUpDropCircle,
                  color: AppConst.kLight,
                ),
        ),
        children: [
          for (final todo in tomorrowTasks)
            TodoTile(
              title: todo.title,
              description: todo.desc,
              color: colors,
              start: todo.startTime,
              end: todo.endTime,
              delete: () {
                ref.read(todoStateProvider.notifier).deleteTodo(todo.id ?? 0);
              },
              editWidget: GestureDetector(
                onTap: () {
                  titles = todo.title.toString();
                  descs = todo.desc.toString();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateTask(
                                id: todo.id ?? 0,
                              )));
                },
                child: Icon(MdiIcons.circleEditOutline),
              ),
              switcher: const SizedBox.shrink(),
            )
        ]);
  }
}
