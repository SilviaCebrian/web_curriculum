import 'package:flutter/material.dart';
import 'package:simple_animated_icon/simple_animated_icon.dart';

class CloseButtonAnimated extends StatefulWidget {
  const CloseButtonAnimated(
      {Key? key,
      required this.buttonSize,
      required this.onPressed,
      required this.color})
      : super(key: key);
  final double buttonSize;
  final Function onPressed;
  final Color color;
  @override
  _CloseButtonAnimatedState createState() => _CloseButtonAnimatedState();
}

class _CloseButtonAnimatedState extends State<CloseButtonAnimated>
    with SingleTickerProviderStateMixin {
  bool _isOpened = false;
  late AnimationController _animationController;
  late Animation<double> _progress;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 300))
          ..addListener(() {
            setState(() {
              if (_isOpened && _progress.value == 1) {
                widget.onPressed();
              }
            });
          });

    _progress =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void animate() {
    if (_isOpened) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }

    setState(() {
      _isOpened = !_isOpened;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        color: widget.color,
        iconSize: widget.buttonSize,
        onPressed: animate,
        icon: SimpleAnimatedIcon(
          startIcon: Icons.close_rounded,
          endIcon: Icons.close_rounded,
          progress: _progress,
          transitions: const [Transitions.rotate_cw, Transitions.zoom_in],
        ));
  }
}
