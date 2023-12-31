import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lachochant_app/common/helpers/notifications_helper.dart';
import 'package:lachochant_app/common/models/task_models.dart';
import 'package:lachochant_app/common/utils/constants.dart';
import 'package:lachochant_app/common/widgets/appstyle.dart';
import 'package:lachochant_app/common/widgets/custom_otn_btn.dart';
import 'package:lachochant_app/common/widgets/custom_text.dart';
import 'package:lachochant_app/common/widgets/height_spacer.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:lachochant_app/common/widgets/show_dialogue.dart';
import 'package:lachochant_app/features/todo/controllers/dates/dates_provider.dart';
import 'package:lachochant_app/features/todo/controllers/todo/todo_provider.dart';
import 'package:lachochant_app/features/todo/pages/homepage.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  final TextEditingController title = TextEditingController();
  final TextEditingController desc = TextEditingController();
  List<int> notification = [];
  late NotificationsHelper notifierHelper;
  late NotificationsHelper controller;
  final TextEditingController search = TextEditingController();

  @override
  void initState() {
    notifierHelper = NotificationsHelper(ref: ref);
    Future.delayed(const Duration(seconds: 0), () {
      controller = NotificationsHelper(ref: ref);
    });
    notifierHelper.initializeNotification();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scheduleDate = ref.watch(dateStateProvider);
    var start = ref.watch(startTimeStateProvider);
    var finish = ref.watch(finishTimeStateProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const HeightSpacer(hieght: 20),
            CustomTextField(
              hintText: "Add Title",
              controller: title,
              hintStyle: appstyle(16, AppConst.kGreyDk, FontWeight.w600),
            ),
            const HeightSpacer(hieght: 20),
            CustomTextField(
              hintText: "Add Description",
              controller: desc,
              hintStyle: appstyle(16, AppConst.kGreyDk, FontWeight.w600),
            ),
            const HeightSpacer(hieght: 20),
            CustomOTLNBTN(
                onTap: () {
                  picker.DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      theme: const picker.DatePickerTheme(
                          doneStyle:
                              TextStyle(color: AppConst.kGreen, fontSize: 16)),
                      onConfirm: (date) {
                    ref
                        .read(dateStateProvider.notifier)
                        .setDate(date.toString());
                  }, currentTime: DateTime.now(), locale: picker.LocaleType.en);
                },
                widht: AppConst.kWidth,
                height: 52.h,
                color: AppConst.kGreen,
                color2: AppConst.kBlueLight,
                text: scheduleDate == ""
                    ? "Set Date"
                    : scheduleDate.substring(0, 10)),
            const HeightSpacer(hieght: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOTLNBTN(
                    onTap: () {
                      picker.DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onConfirm: (date) {
                        ref
                            .read(startTimeStateProvider.notifier)
                            .setStart(date.toString());
                        notification = ref
                            .read(startTimeStateProvider.notifier)
                            .dates(date);
                      }, locale: picker.LocaleType.en);
                    },
                    widht: AppConst.kWidth * 0.4,
                    height: 52.h,
                    color: AppConst.kGreen,
                    color2: AppConst.kBlueLight,
                    text: start == "" ? "Start Time" : start.substring(10, 16)),
                CustomOTLNBTN(
                    onTap: () {
                      picker.DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onConfirm: (date) {
                        ref
                            .read(finishTimeStateProvider.notifier)
                            .setFinish(date.toString());
                      }, locale: picker.LocaleType.en);
                    },
                    widht: AppConst.kWidth * 0.4,
                    height: 52.h,
                    color: AppConst.kGreen,
                    color2: AppConst.kBlueLight,
                    text: finish == ""
                        ? "Finish Time"
                        : finish.substring(10, 16)),
              ],
            ),
            const HeightSpacer(hieght: 20),
            CustomOTLNBTN(
                onTap: () {
                  if (title.text.isNotEmpty &&
                      desc.text.isNotEmpty &&
                      scheduleDate.isNotEmpty &&
                      start.isNotEmpty &&
                      finish.isNotEmpty) {
                    Task task = Task(
                        title: title.text,
                        desc: desc.text,
                        isCompleted: 0,
                        date: scheduleDate,
                        startTime: start.substring(10, 16),
                        endTime: finish.substring(10, 16),
                        remind: 0,
                        repeat: "yes");
                    notifierHelper.scheduledNotification(
                        notification[0],
                        notification[1],
                        notification[2],
                        notification[3],
                        task);
                    ref.read(todoStateProvider.notifier).addItem(task);
                    // ref.read(finishTimeStateProvider.notifier).setFinish('');
                    // ref.read(startTimeStateProvider.notifier).setStart('');
                    // ref.read(dateStateProvider.notifier).setDate('');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const HomePage()));
                  } else {
                    showAlertDialog(context: context, message: 'Failed to add task');
                  }
                },
                widht: AppConst.kWidth,
                height: 52.h,
                color: AppConst.kLight,
                color2: AppConst.kGreen,
                text: "Submit"),
          ],
        ),
      ),
    );
  }
}
