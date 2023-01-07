import 'package:curriculum_web/views/base_view.dart';
import 'package:flutter/material.dart';

class MobileView extends BaseView {
  const MobileView(
      {Key? key,
      Key? keyChild,
      required controller,
      required tabs,
      required this.scaffoldKey,
      required this.width})
      : super(key: key, controller: controller, tabs: tabs);

  final double width;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return contentView(
        context,
        IconButton(
            padding: EdgeInsets.zero,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () => {scaffoldKey.currentState!.openEndDrawer()},
            icon: const Icon(
              Icons.menu_rounded,
              size: 30,
            ),
            color: Colors.white),
        width);
  }
}
