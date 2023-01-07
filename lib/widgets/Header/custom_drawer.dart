import 'package:flutter/material.dart';
import '../../views/base_view.dart';
import '../Custom/close_button_animated.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer(
      {Key? key,
      required this.tabs,
      required this.height,
      required this.controller})
      : super(key: key);
  final List<ContentView> tabs;
  final double height;
  final TabController controller;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _drawerSlideController;
  static const _initialDelayTime = Duration(milliseconds: 50);
  static const _itemSlideTime = Duration(milliseconds: 450);
  static const _staggerTime = Duration(milliseconds: 200);
  static const _buttonDelayTime = Duration(milliseconds: 150);
  static const _buttonTime = Duration(milliseconds: 500);

  // ignore: prefer_typing_uninitialized_variables
  late var _animationDuration;
  final List<Interval> _itemSlideIntervals = [];
  // ignore: unused_field
  late Interval _buttonInterval;
  @override
  void initState() {
    _animationDuration = _initialDelayTime +
        (_staggerTime * widget.tabs.length) +
        _buttonDelayTime +
        _buttonTime;
    _createAnimationIntervals();

    _drawerSlideController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    _drawerSlideController.dispose();
    super.dispose();
  }

  void _createAnimationIntervals() {
    for (var i = 0; i < widget.tabs.length; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }

    final buttonStartTime =
        Duration(milliseconds: (widget.tabs.length * 50)) + _buttonDelayTime;
    final buttonEndTime = buttonStartTime + _buttonTime;
    _buttonInterval = Interval(
      buttonStartTime.inMilliseconds / _animationDuration.inMilliseconds,
      buttonEndTime.inMilliseconds / _animationDuration.inMilliseconds,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: CloseButtonAnimated(
                  buttonSize: 30,
                  color: Theme.of(context).primaryColor,
                  onPressed: () => Navigator.of(context).pop()),
            ),
            _buildContent()
          ],
        ));
  }

  Widget _buildContent() {
    return Expanded(
      flex: 2,
      child: ListView(
          children: widget.tabs
              // ignore: avoid_unnecessary_containers
              .map((e) => Container(
                    child: AnimatedBuilder(
                      animation: _drawerSlideController,
                      builder: (BuildContext context, Widget? child) {
                        final animationPercent = Curves.easeOut.transform(
                          _itemSlideIntervals[e.tab.position]
                              .transform(_drawerSlideController.value),
                        );
                        final opacity = animationPercent;
                        final slideDistance = (1.0 - animationPercent) * 150;

                        return Opacity(
                          opacity: opacity,
                          child: Transform.translate(
                            offset: Offset(slideDistance, 0),
                            child: child,
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10, top: 10),
                        child: ListTile(
                            title: Text(e.tab.title,
                                style: const TextStyle(
                                    fontFamily: 'Boogaloo',
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            onTap: () async {
                              widget.controller.animateTo(e.tab.position,
                                  duration: const Duration(seconds: 2),
                                  curve: Curves.easeInOut);
                              Navigator.of(context).pop();
                            }),
                      ),
                    ),
                  ))
              .toList()),
    );
  }
}
