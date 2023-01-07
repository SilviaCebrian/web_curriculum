import 'package:curriculum_web/views/base_view.dart';
import 'package:flutter/material.dart';
import '../widgets/Header/custom_tab_bar.dart';

class DesktopView extends BaseView {
  const DesktopView(
      {Key? key,
      Key? keyChild,
      required controller,
      required tabs,
      required this.height})
      : super(key: key, controller: controller, tabs: tabs);
  final double height;

  @override
  Widget build(BuildContext context) {
    return contentView(
        context,
        Row(
          children: [
          CustomTabBar(
            controller: controller,
            tabs: tabs.map((e) => e.tab).toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(left:50),
            child: email(context),
          )
        ]),
        height);
  }
}
