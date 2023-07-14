import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lachochant_app/common/utils/constants.dart';
import 'package:lachochant_app/common/widgets/appstyle.dart';
import 'package:lachochant_app/common/widgets/custom_text.dart';
import 'package:lachochant_app/common/widgets/height_spacer.dart';
import 'package:lachochant_app/common/widgets/reusable_text.dart';
import 'package:lachochant_app/common/widgets/width_spacer.dart';
import 'package:lachochant_app/common/widgets/xpansion_tile.dart';
import 'package:lachochant_app/features/todo/controllers/todo/todo_provider.dart';
import 'package:lachochant_app/features/todo/controllers/xpansion_provider.dart';
import 'package:lachochant_app/features/todo/pages/add.dart';
import 'package:lachochant_app/features/todo/widgets/today_task.dart';
import 'package:lachochant_app/features/todo/widgets/todo_tile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:lachochant_app/features/todo/widgets/tomorrow_list.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 2, vsync: this);
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.watch(todoStateProvider.notifier).refresh();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                        text: "Dashboard",
                        style: appstyle(18, AppConst.kLight, FontWeight.bold)),
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: const BoxDecoration(
                        color: AppConst.kLight,
                        borderRadius: BorderRadius.all(
                          Radius.circular(9),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddTask()));
                        },
                        child: const Icon(
                          Icons.add,
                          color: AppConst.kBkDark,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const HeightSpacer(hieght: 10),
              CustomTextField(
                hintText: "Search",
                controller: search,
                prefixIcon: Container(
                  padding: EdgeInsets.all(14.h),
                  child: GestureDetector(
                    onTap: null,
                    child: const Icon(
                      Icons.search_outlined,
                      color: AppConst.kGreyLight,
                    ),
                  ),
                ),
                suffixIcon: const Icon(
                  FontAwesomeIcons.sliders,
                  color: AppConst.kGreyLight,
                ),
              ),
              const HeightSpacer(hieght: 12),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              const HeightSpacer(hieght: 15),
              Row(
                children: [
                  const Icon(
                    FontAwesomeIcons.listCheck,
                    size: 20,
                    color: AppConst.kLight,
                  ),
                  const WidthSpacer(wydth: 10),
                  ReusableText(
                    text: "Today's Task",
                    style: appstyle(18, AppConst.kLight, FontWeight.bold),
                  ),
                ],
              ),
              const HeightSpacer(hieght: 20),
              Container(
                decoration: BoxDecoration(
                    color: AppConst.kLight,
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppConst.kRadius))),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      color: AppConst.kGreyLight,
                      borderRadius:
                          BorderRadius.all(Radius.circular(AppConst.kRadius))),
                  controller: tabController,
                  labelPadding: EdgeInsets.zero,
                  isScrollable: false,
                  labelColor: AppConst.kBlueLight,
                  labelStyle:
                      appstyle(24, AppConst.kBlueLight, FontWeight.w700),
                  unselectedLabelColor: AppConst.kLight,
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: AppConst.kWidth * 0.5,
                        child: Center(
                          child: ReusableText(
                              text: "Pending",
                              style: appstyle(
                                  16, AppConst.kBkDark, FontWeight.bold)),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: EdgeInsets.only(left: 30.h),
                        width: AppConst.kWidth * 0.5,
                        child: Center(
                          child: ReusableText(
                              text: "Completed",
                              style: appstyle(
                                  16, AppConst.kBkDark, FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(hieght: 20),
              SizedBox(
                height: AppConst.kHeight * 0.3,
                width: AppConst.kWidth,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppConst.kRadius)),
                  child: TabBarView(controller: tabController, children: [
                    Container(
                        color: AppConst.kBkLight,
                        height: AppConst.kHeight * 0.3,
                        child: const TodayTasks ()),
                    Container(
                      color: AppConst.kBkLight,
                      height: AppConst.kHeight * 0.3,
                    ),
                  ]),
                ),
              ),
              const HeightSpacer(hieght: 20),
              const TomorrowList(),
              const HeightSpacer(hieght: 10),
              XpansionTile(
                  text: DateTime.now()
                      .add(const Duration(days: 2))
                      .toString()
                      .substring(5, 10),
                  text2: "Task are shown here",
                  onExpansionChanged: (bool expanded) {
                    ref
                        .read(xpansionState0Provider.notifier)
                        .setStart(!expanded);
                  },
                  trailing: Padding(
                    padding: EdgeInsets.only(right: 12.0.w),
                    child: ref.watch(xpansionState0Provider)
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
                    TodoTile(
                      start: "03.00",
                      end: "05.00",
                      switcher: Switch(value: true, onChanged: (value) {}),
                    )
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}