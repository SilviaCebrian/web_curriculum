import 'package:flutter/material.dart';
import '../Custom/animated_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutMeTab extends StatefulWidget {
  const AboutMeTab({Key? key}) : super(key: key);

  @override
  State<AboutMeTab> createState() => _AboutMeTabState();
}

class _AboutMeTabState extends State<AboutMeTab> {
  final double _knowledgeWidgetHeight = 260;
  final GlobalKey _key = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  bool toBottom = true;
  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width >= 1500;
    return LayoutBuilder(
      builder: (p0, p1) {
        return Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  key: _key,
                  padding:
                      EdgeInsets.symmetric(vertical: isScreenWide ? 30 : 10),
                  child: isScreenWide
                      ? Flex(
                          mainAxisAlignment: MainAxisAlignment.start,
                          direction: Axis.vertical,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                aboutContentLeft(),
                                aboutContentRight(isScreenWide)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _moreThings(isScreenWide),
                              ],
                            )
                          ],
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05),
                          child: Flex(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              direction: Axis.vertical,
                              children: [
                                aboutContentLeft(),
                                aboutContentRight(isScreenWide),
                                _moreThings(isScreenWide),
                              ]),
                        ),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                right: 10,
                child: FloatingActionButton(
                  backgroundColor:
                      Theme.of(context).primaryColor.withAlpha(100),
                  child: Icon(toBottom ? Icons.expand_more : Icons.expand_less),
                  onPressed: () {
                    double position =
                        toBottom ? _key.currentContext!.size!.height : 0;
                    _scrollController.jumpTo(position);

                    setState(() {
                      toBottom = !toBottom;
                    });
                  },
                )),
          ],
        );
      },
    );
  }

  Widget aboutContentLeft() {
    bool isScreenWide = MediaQuery.of(context).size.width >= 500;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 80),
      width: 450,
      height: 500,
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(width: 1.5, color: Theme.of(context).primaryColor),
        left: BorderSide(width: 1.5, color: Theme.of(context).primaryColor),
        bottom: BorderSide(width: 1.5, color: Theme.of(context).primaryColor),
      )),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        height: 300,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: AppLocalizations.of(context).yearsWorking,
                  style: const TextStyle(
                      height: 1,
                      color: Colors.white,
                      fontFamily: 'Dangrek',
                      fontSize: 180),
                  children: <TextSpan>[
                    TextSpan(
                        text: '.',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'Dangrek',
                            fontSize: 150)),
                  ],
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                    isScreenWide
                        ? AppLocalizations.of(context).yearsWorkingMultiText1
                        : AppLocalizations.of(context).yearsWorkingMultiText2,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        leadingDistribution:
                            TextLeadingDistribution.proportional,
                        color: Colors.white,
                        fontFamily: 'Questrial',
                        fontSize: 25)),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 3, left: 20),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 2,
                                  color: Theme.of(context).primaryColor)))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget aboutContentRight(bool _isScreenWide) {
    return SizedBox(
      width: 500,
      height: 550,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(AppLocalizations.of(context).experienceTitle,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Questrial',
                        fontSize: 45)),
              ),
              const SizedBox(height: 5),
              Text(AppLocalizations.of(context).experienceSubtitle,
                  style: const TextStyle(
                      leadingDistribution: TextLeadingDistribution.proportional,
                      color: Colors.grey,
                      fontFamily: 'Questrial',
                      fontSize: 18)),
            ],
          ),
          Expanded(
            flex: 1,
            child: AnimatedCustomList(
              fromTop: true,
              items: [
                _curriculumEntry(
                    AppLocalizations.of(context).experienceEntry1Title,
                    _listOfThings([
                      AppLocalizations.of(context).experienceEntry1Example1,
                      AppLocalizations.of(context).experienceEntry1Example2,
                      AppLocalizations.of(context).experienceEntry1Example3,
                    ])),
                _curriculumEntry(
                    AppLocalizations.of(context).experienceEntry2Title,
                    _listOfThings([
                      AppLocalizations.of(context).experienceEntry2Example1,
                      AppLocalizations.of(context).experienceEntry2Example2,
                    ])),
                _curriculumEntry(
                    AppLocalizations.of(context).experienceEntry3Title,
                    _listOfThings([
                      AppLocalizations.of(context).experienceEntry3Example1,
                    ])),
              ],
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15),
              initialDelay: 500,
              direction: Axis.vertical,
              height: 400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _curriculumEntry(String _text1, Widget _list) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Text(_text1,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Boogaloo',
                  fontSize: 25)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: _list,
        )
      ],
    );
  }

  Widget _listOfThings(List<String> _list) {
    final listItems = <Widget>[];
    for (var i = 0; i < _list.length; i++) {
      listItems.add(Padding(
        padding: const EdgeInsets.only(bottom: 10.0, left: 10),
        child: Text(_list[i],
            style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontFamily: 'Questrial',
                fontSize: 18)),
      ));
    }
    return ListView(
      shrinkWrap: true,
      children: listItems,
    );
  }

  Widget _moreThings(bool _isScreenWide) {
    return Flex(
      mainAxisAlignment: MainAxisAlignment.start,
      direction: Axis.vertical,
      children: [
        AnimatedCustomList(
          fromTop: false,
          items: [
            _knowledgeWidget(
                "assets/icons/traducir.png",
                AppLocalizations.of(context).otherKnowledge1Title,
                AppLocalizations.of(context).otherKnowledge1Description),
            _knowledgeWidget(
                "assets/icons/code.png",
                AppLocalizations.of(context).otherKnowledge2Title,
                AppLocalizations.of(context).otherKnowledge2Description),
            _knowledgeWidget(
                "assets/icons/herramienta.png",
                AppLocalizations.of(context).otherKnowledge3Title,
                AppLocalizations.of(context).otherKnowledge3Description),
            _knowledgeWidget(
                "assets/icons/bd.png",
                AppLocalizations.of(context).otherKnowledge4Title,
                AppLocalizations.of(context).otherKnowledge4Description),
            _knowledgeWidget(
                "assets/icons/seo.png",
                AppLocalizations.of(context).otherKnowledge5Title,
                AppLocalizations.of(context).otherKnowledge5Description),
          ],
          padding: EdgeInsets.zero,
          initialDelay: 1700,
          direction: _isScreenWide ? Axis.horizontal : Axis.vertical,
          height: _isScreenWide ? 150 : _knowledgeWidgetHeight * 5,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: AnimatedCustomList(
            fromTop: false,
            items: [
              _knowledgeWidget(
                  "assets/icons/ar.png",
                    AppLocalizations.of(context).otherKnowledge6Title,
               AppLocalizations.of(context).otherKnowledge6Description),
              _knowledgeWidget(
                  "assets/icons/ai.png",
                     AppLocalizations.of(context).otherKnowledge7Title,
               AppLocalizations.of(context).otherKnowledge7Description),
              _knowledgeWidget(
                  "assets/icons/blockchain.png",
                    AppLocalizations.of(context).otherKnowledge8Title,
               AppLocalizations.of(context).otherKnowledge8Description),
              _knowledgeWidget(
                  "assets/icons/design.png",
                  AppLocalizations.of(context).otherKnowledge9Title,
               AppLocalizations.of(context).otherKnowledge9Description),
              _knowledgeWidget(
                  "assets/icons/robot.png",
                    AppLocalizations.of(context).otherKnowledge10Title,
               AppLocalizations.of(context).otherKnowledge10Description),
            ],
            padding: _isScreenWide ? EdgeInsets.zero : EdgeInsets.zero,
            initialDelay: 1600,
            direction: _isScreenWide ? Axis.horizontal : Axis.vertical,
            height: _isScreenWide ? 160 : _knowledgeWidgetHeight * 5,
          ),
        ),
      ],
    );
  }

  Widget _knowledgeWidget(
    String _iconRoute,
    String _text1,
    String _text2,
  ) {
    bool isScreenWide = MediaQuery.of(context).size.width >= 1500;
    return Container(
      // color: Colors.purple,
      height: isScreenWide ? 0 : _knowledgeWidgetHeight,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
      margin: EdgeInsets.zero,
      child: SizedBox(
        width: 150,
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              // color: Colors.black,
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage(_iconRoute),
                width: 50,
                height: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(_text1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Questrial',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            Text(
              _text2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: 'Questrial',
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
