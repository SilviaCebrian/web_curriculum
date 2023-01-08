// ignore_for_file: constant_identifier_names

library full_screen_image_null_safe;

import 'package:curriculum_web/widgets/Custom/close_button_animated.dart';
import 'package:flutter/material.dart';

// import 'package:vector_math/vector_math_64.dart' as vector;
//full_screen_image_null_safe package
class CustomFullScreenWidget extends StatelessWidget {
  const CustomFullScreenWidget(
      {Key? key,
      required this.backgroundColor,
      this.backgroundIsTransparent = true,
      this.disposeLevel,
      required this.path,
      required this.size})
      : super(key: key);

  final String path;
  final Color backgroundColor;
  final bool backgroundIsTransparent;
  final DisposeLevel? disposeLevel;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                  opaque: false,
                  barrierColor: backgroundIsTransparent
                      ? Colors.white.withOpacity(0)
                      : backgroundColor,
                  pageBuilder: (BuildContext context, _, __) {
                    return FullScreenPageCustom(
                      child: Image.asset(path,
                          fit: MediaQuery.of(context).size.width >= 1500
                              ? BoxFit.contain
                              : BoxFit.fitWidth),
                      backgroundColor: backgroundColor,
                      backgroundIsTransparent: backgroundIsTransparent,
                      disposeLevel: disposeLevel,
                    );
                  }));
        },
        child: MediaQuery.of(context).size.width > 1500
            ? Image.asset(
                path,
                fit: BoxFit.scaleDown,
                width: size.width,
                height: size.height,
              )
            : Image.asset(
                path,
                fit: BoxFit.scaleDown,

                // width: size.width,
                // height: size.height,
              )
        // SizedBox(
        //   width: size.width,
        //   height: size.height,
        //   child: Image.asset(
        //     path,
        //     fit: BoxFit.cover,
        //   ),
        // ),
        );
  }
}

enum DisposeLevel { High, Medium, Low }

class FullScreenPageCustom extends StatefulWidget {
  const FullScreenPageCustom(
      {Key? key,
      required this.child,
      this.backgroundColor = Colors.black,
      this.backgroundIsTransparent = true,
      this.disposeLevel = DisposeLevel.Medium})
      : super(key: key);

  final Widget child;
  final Color backgroundColor;
  final bool backgroundIsTransparent;
  final DisposeLevel? disposeLevel;

  @override
  _FullScreenPageCustomState createState() => _FullScreenPageCustomState();
}

class _FullScreenPageCustomState extends State<FullScreenPageCustom> {
  double? initialPositionY = 0;

  double? currentPositionY = 0;

  double positionYDelta = 0;

  double opacity = 1;

  double disposeLimit = 150;
  bool itsOpen = false;
  late Duration animationDuration;

  @override
  void initState() {
    super.initState();
    itsOpen = false;
    setDisposeLevel();
    animationDuration = Duration.zero;
  }

  setDisposeLevel() {
    setState(() {
      if (widget.disposeLevel == DisposeLevel.High) {
        disposeLimit = 300;
      } else if (widget.disposeLevel == DisposeLevel.Medium) {
        disposeLimit = 200;
      } else {
        disposeLimit = 100;
      }
    });
  }

  // ignore: unused_element
  void _startVerticalDrag(details) {
    setState(() {
      initialPositionY = details.globalPosition.dy;
    });
  }

  // ignore: unused_element
  void _whileVerticalDrag(details) {
    setState(() {
      currentPositionY = details.globalPosition.dy;
      positionYDelta = currentPositionY! - initialPositionY!;
      setOpacity();
    });
  }

  setOpacity() {
    double tmp = positionYDelta < 0
        ? 1 - ((positionYDelta / 1000) * -1)
        : 1 - (positionYDelta / 1000);

    if (tmp > 1) {
      opacity = 1;
    } else if (tmp < 0) {
      opacity = 0;
    } else {
      opacity = tmp;
    }

    if (positionYDelta > disposeLimit || positionYDelta < -disposeLimit) {
      opacity = 0.5;
    }
  }

  // ignore: unused_element
  _endVerticalDrag(DragEndDetails details) {
    if (positionYDelta > disposeLimit || positionYDelta < -disposeLimit) {
      Navigator.of(context).pop();
    } else {
      setState(() {
        animationDuration = const Duration(milliseconds: 300);
        opacity = 1;
        positionYDelta = 0;
      });

      Future.delayed(animationDuration).then((_) {
        setState(() {
          animationDuration = Duration.zero;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundIsTransparent
          ? Colors.transparent
          : widget.backgroundColor,
      body: Container(
          color: widget.backgroundColor.withOpacity(opacity),
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: CloseButtonAnimated(
                  buttonSize: 50,
                  color: Theme.of(context).primaryColor,
                  onPressed: () => Navigator.of(context).pop()),
            ),
            InteractiveViewer(
                minScale: 1,
                maxScale: 4,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 200,
                    child: Center(child: widget.child))),
          ])),
    );
  }
}
