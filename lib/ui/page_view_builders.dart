import 'package:clean_calendar/state/page_controller.dart';
import 'package:clean_calendar/state/providers.dart';
import 'package:clean_calendar/ui/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NonScrollablePageViewBuilder extends StatelessWidget {
  const NonScrollablePageViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final PageControllerState readPageControllerStateProviderValue =
            ref.read(pageControllerStateProvider);
        final PageController pageController =
            readPageControllerStateProviderValue.pageController;

        final List<int> listOfIntegersFromStartToAndEndDateWithInitialAs0 =
            ref.watch(pageControllerStateProvider.select((value) =>
                value.listOfIntegersFromStartToAndEndDateWithInitialAs0));

        final DateTime initialViewMonthDateTime = ref.watch(
            calendarPropertiesStateProvider
                .select((value) => value.initialViewMonthDateTime));

        return SizedBox(
          height: 40 * 6,
          child: PageView.custom(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            childrenDelegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return KeepAlive(
                    data: DateTime.utc(
                        initialViewMonthDateTime.year,
                        initialViewMonthDateTime.month +
                            listOfIntegersFromStartToAndEndDateWithInitialAs0[
                                index],
                        1),
                    key: ValueKey<int>(
                        listOfIntegersFromStartToAndEndDateWithInitialAs0[
                            index]),
                  );
                },
                childCount:
                    listOfIntegersFromStartToAndEndDateWithInitialAs0.length,
                findChildIndexCallback: (Key key) {
                  final ValueKey<int> valueKey = key as ValueKey<int>;
                  final int data = valueKey.value;
                  return listOfIntegersFromStartToAndEndDateWithInitialAs0
                      .indexOf(data);
                }),
          ),
        );
      },
    );
  }
}

class ScrollablePageViewBuilder extends StatelessWidget {
  const ScrollablePageViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final PageControllerState readPageControllerStateProviderValue =
            ref.read(pageControllerStateProvider);
        final PageController pageController =
            readPageControllerStateProviderValue.pageController;

        final List<int> listOfIntegersFromStartToAndEndDateWithInitialAs0 =
            ref.watch(pageControllerStateProvider.select((value) =>
                value.listOfIntegersFromStartToAndEndDateWithInitialAs0));

        final DateTime initialViewMonthDateTime = ref.watch(
            calendarPropertiesStateProvider
                .select((value) => value.initialViewMonthDateTime));
        return SizedBox(
          height: 40 * 6,
          child: PageView.custom(
            controller: pageController,
            childrenDelegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return KeepAlive(
                    data: DateTime.utc(
                        initialViewMonthDateTime.year,
                        initialViewMonthDateTime.month +
                            listOfIntegersFromStartToAndEndDateWithInitialAs0[
                                index],
                        1),
                    key: ValueKey<int>(
                        listOfIntegersFromStartToAndEndDateWithInitialAs0[
                            index]),
                  );
                },
                childCount:
                    listOfIntegersFromStartToAndEndDateWithInitialAs0.length,
                findChildIndexCallback: (Key key) {
                  final ValueKey<int> valueKey = key as ValueKey<int>;
                  final int data = valueKey.value;
                  return listOfIntegersFromStartToAndEndDateWithInitialAs0
                      .indexOf(data);
                }),
          ),
        );
      },
    );
  }
}

class KeepAlive extends StatefulWidget {
  const KeepAlive({Key? key, required this.data}) : super(key: key);

  final DateTime data;

  @override
  State<KeepAlive> createState() => _KeepAliveState();
}

class _KeepAliveState extends State<KeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CalendarDatesSection(
      pageViewMonthDate: widget.data,
    );
  }
}
