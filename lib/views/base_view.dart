import 'package:flutter/material.dart';
import '../widgets/Header/custom_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:curriculum_web/utils/helpers.dart' as helper;


abstract class BaseView extends StatelessWidget {
  const BaseView({Key? key, required this.controller, required this.tabs})
      : super(key: key);
  final TabController controller;
  final List<ContentView> tabs;



  Widget _topName(context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: RichText(
        text: TextSpan(
          text: AppLocalizations.of(context)!.headerTitle,
          style: const TextStyle(
              color: Colors.white, fontFamily: 'Dangrek', fontSize: 30),
          children: <TextSpan>[
            TextSpan(
                text: '.',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Boogaloo',
                    fontSize: 35)),
          ],
        ),
      ),
    );
  }

  Widget email(context) {
    double? textSize = 18;
    return TextButton(
        style: ButtonStyle(
            overlayColor:
                MaterialStatePropertyAll(Theme.of(context).primaryColor)),
        onPressed: () => helper.mailTo,
        child: Align(
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(
              text: AppLocalizations.of(context)?.email,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Dangrek',
                  fontSize: textSize),
              children: <TextSpan>[
                TextSpan(
                    text: '.',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'Dangrek',
                        fontSize: textSize)),
                TextSpan(
                    text: 'com',
                    style:
                        TextStyle(fontFamily: 'Dangrek', fontSize: textSize)),
              ],
            ),
          ),
        ));
  }

  Widget contentView(
      BuildContext _context, Widget _widgetChild, double screenRef) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: _topName(_context),
                ),
                _widgetChild
              ],
            )),
        Expanded(
          child: SizedBox(
              height: screenRef,
              child: TabBarView(
                  controller: controller,
                  children: tabs.map((e) => e.content).toList())),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text("\u00a9 Silvia Cebrián Ruiz ${DateTime.now().year}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Questrial',
                      fontSize: 15))
            ],
          ),
        )
      ],
    );
  }
}

class ContentView {
  final CustomTab tab;
  final Widget content;

  const ContentView({Key? key, required this.tab, required this.content});
}
