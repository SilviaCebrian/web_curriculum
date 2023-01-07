import 'package:flutter/material.dart';

class AnimatedCustomList extends StatefulWidget {
  const AnimatedCustomList(
      {Key? key,
      required this.items,
      required this.padding,
      required this.initialDelay,
      required this.direction,
      required this.height, required this.fromTop})
      : super(key: key);
  final List<Widget> items;
  final EdgeInsets padding;
  final int initialDelay;
  final Axis direction;
  final double height;
  final bool fromTop;
  @override
  State<AnimatedCustomList> createState() => _AnimatedCustomListState();
}

class _AnimatedCustomListState extends State<AnimatedCustomList>
    with SingleTickerProviderStateMixin {
  late AnimationController _drawerSlideController;
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
    _animationDuration = Duration(milliseconds: widget.initialDelay) +
        (_staggerTime * widget.items.length) +
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
    for (var i = 0; i < widget.items.length; ++i) {
      final startTime =
          Duration(milliseconds: widget.initialDelay) + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }

    final buttonStartTime =
        Duration(milliseconds: (widget.items.length * 50)) + _buttonDelayTime;
    final buttonEndTime = buttonStartTime + _buttonTime;
    _buttonInterval = Interval(
      buttonStartTime.inMilliseconds / _animationDuration.inMilliseconds,
      buttonEndTime.inMilliseconds / _animationDuration.inMilliseconds,
    );
  }

  List<Widget> _buildListItems() {
    final listItems = <Widget>[];
    for (var i = 0; i < widget.items.length; ++i) {
      listItems.add(AnimatedBuilder(
        animation: _drawerSlideController,
        builder: (context, child) {
          final animationPercent = Curves.easeOut.transform(
            _itemSlideIntervals[i].transform(_drawerSlideController.value),
          );
          final opacity = animationPercent;
          final slideDistance = (1.0 - animationPercent) * 150;

          return Opacity(
            opacity: opacity,
            child: Transform.translate(
              offset: widget.fromTop
                  ? Offset(slideDistance, 0)
                  : Offset(0, slideDistance),
              child: child,
            ),
          );
        },
        child: Padding(padding: widget.padding, child: widget.items[i]),
      ));
    }

    return listItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
       height: widget.height == 0 ?  null : widget.height,
      child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: widget.direction,
          shrinkWrap: true,
          children: _buildListItems()),
    );
  }
}
