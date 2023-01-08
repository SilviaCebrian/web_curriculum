import 'package:flutter/material.dart';
import 'package:curriculum_web/widgets/Custom/animated_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width >= 1500;
    return LayoutBuilder(
      builder: (p0, p1) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: isScreenWide ? 50 : 10),
            child: Container(
                height: isScreenWide ? 650 : 1400,
                decoration: BoxDecoration(
                    border: Border.symmetric(
                      vertical: BorderSide.none,
                      horizontal: BorderSide(
                          width: 2.0, color: Theme.of(context).primaryColor),
                    ),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: const AssetImage('assets/photos/keyboard.jpg'),
                        colorFilter: ColorFilter.mode(
                          Colors.purple.withOpacity(0.8),
                          BlendMode.hue,
                        ))),
                child: isScreenWide
                    ? Row(
                        children: _content(35, 20),
                      )
                    : Column(
                        children: _content(30, 20),
                      )),
          ),
        );
      },
    );
  }

  List<Widget> _content(double _fontSize1, _fontSize2) {
    return [
      Expanded(
        flex: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_me(), _title(_fontSize1, 20), _subtitle(_fontSize2, 20)],
        ),
      ),
      Flexible(
        fit: FlexFit.loose,
        flex: 2,
        child: AnimatedCustomList(
          fromTop: true,
          items: [
            _textItem(AppLocalizations.of(context).knowledgeText),
            _textItem(AppLocalizations.of(context).knowledge_1),
            _textItem(AppLocalizations.of(context).knowledge_2),
            _textItem(AppLocalizations.of(context).knowledge_3),
            _textItem(AppLocalizations.of(context).knowledge_4),
            _textItem(AppLocalizations.of(context).knowledge_5),
            _textItem(AppLocalizations.of(context).knowledge_6),
          ],
          padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16),
          initialDelay: 250,
          direction: Axis.vertical,
          height: 700,
        ),
      ),
    ];
  }

  Widget _me() {
    return Container(
      margin: const EdgeInsets.only(bottom: 60),
      height: 350,
      width: 350,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage('assets/photos/me.png'),
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8),
                BlendMode.modulate,
              ))),
    );
  }

  Widget _title(double _fontSize, double _padding) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
      child: Text(AppLocalizations.of(context).homeTabTitle,
      textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Questrial',
              fontSize: _fontSize,
              shadows: const [
                Shadow(
                  blurRadius: 1,
                  color: Color.fromARGB(255, 0, 0, 0),
                  offset: Offset(3.0, 3.0),
                ),
                Shadow(
                  blurRadius: 1,
                  color: Color(0xFF9E62B9),
                  offset: Offset(1.0, 2.0),
                ),
              ])),
    );
  }

  Widget _subtitle(int _fontSize, double _padding) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Text(AppLocalizations.of(context).homeTabSubtitle,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Color.fromARGB(255, 190, 190, 190),
              fontFamily: 'Questrial',
              fontWeight: FontWeight.bold,
              fontSize: 20)),
    );
  }

  Widget _textItem(String _text) {
    return Text(_text,
        style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Boogaloo',
            fontSize: 38,
            shadows: [
              Shadow(
                blurRadius: 1,
                color: Color.fromARGB(255, 0, 0, 0),
                offset: Offset(3.0, 2.0),
              ),
              Shadow(
                blurRadius: 1,
                color: Color(0xFF9E62B9),
                offset: Offset(1.0, 1.0),
              ),
            ]));
  }
}
