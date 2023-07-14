import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lachochant_app/features/todo/controllers/todo/todo_provider.dart';
import 'package:lachochant_app/features/todo/widgets/todo_tile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../common/utils/constants.dart';
import '../../../common/widgets/xpansion_tile.dart';
import '../controllers/xpansion_provider.dart';

class TomorrowList extends ConsumerWidget {
  const TomorrowList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoStateProvider);
    var colors = ref.read(todoStateProvider.notifier).getRandomColor();
    String tomorrow = ref.read(todoStateProvider.notifier).getTomorrow();
    var tomorrowTasks = todos.where(
      (element) => element.date!.contains(tomorrow),
    );

    return XpansionTile(
        text: "Tomorrow's Task",
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
                onTap: () {},
              ),
              switcher: const SizedBox.shrink(),
            )
        ]);
  }
}
