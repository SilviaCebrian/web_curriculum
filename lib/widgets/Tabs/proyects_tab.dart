import 'package:flutter/material.dart';
import 'package:curriculum_web/widgets/Custom/animated_list.dart';
import '../Custom/custom_full_screen_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:curriculum_web/utils/helpers.dart' as helper;

class ProyectsTab extends StatefulWidget {
  const ProyectsTab({Key? key}) : super(key: key);

  @override
  State<ProyectsTab> createState() => _ProyectsTabState();
}

class _ProyectsTabState extends State<ProyectsTab> with AdaptiveTextSize {
  // ignore: unused_field
  late Axis _currentDirection;
  final ScrollController _scrollController = ScrollController();
  final Size portrait = const Size(250, 350);
  final Size landscape = const Size(450, 250);

  final List<GlobalKey> _keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];
  @override
  Widget build(BuildContext context) {
    _currentDirection = currentDirection(context);
    List<Widget> children = [
      _flutterContent(),
      _unityContent(),
      _solidityContent(),
    ];
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: LayoutBuilder(builder: (p0, p1) {
            return SingleChildScrollView(
                controller: _scrollController,
                child: Container(
                    margin: const EdgeInsets.only(top: 50),
                    padding: const EdgeInsets.only(top: 50),
                    child: Flex(
                      direction: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: children,
                    )));
          }),
        ),
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withAlpha(50),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          width: 50,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _lateralScrollIconButton('assets/AppLocalizations.of(context)..png', 0),
              _lateralScrollIconButton('assets/icons/unity.png', 1),
              _lateralScrollIconButton('assets/icons/solidity.png', 2),
            ],
          ),
        ),
      ],
    );
  }

  Widget _h1(double _fontSize, double _padding, String _text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
      child: Text(_text,
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Boogaloo',
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

  double _moveTo(int _widgetPosition) {
    double position = 0;
    for (int i = 0; i < _widgetPosition; i++) {
      final RenderBox? box =
          _keys[i].currentContext!.findRenderObject() as RenderBox;
      final Size size = box!.size;
      position += size.height;
    }
    return position;
  }

  Widget _lateralScrollIconButton(String _iconPath, int _widgetPosition) {
    return IconButton(
        iconSize: 35,
        color: Theme.of(context).primaryColor.withAlpha(50),
        onPressed: () {
          _scrollController.jumpTo(_moveTo(_widgetPosition));
        },
        icon: Image.asset(
          _iconPath,
          fit: BoxFit.contain,
          isAntiAlias: true,
          filterQuality: FilterQuality.high,
        ));
  }

  Widget _section(GlobalKey _key, String _iconURL, String _sectionTitle,
      List<Widget> _listEntries) {
    return Padding(
        key: _key,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 75,
                margin: const EdgeInsets.only(bottom: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 2.0,
                            color: Theme.of(context).primaryColor))),
                child: Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Image.asset(
                          _iconURL,
                          width: 40,
                          height: 40,
                          alignment: Alignment.topCenter,
                        )),
                    _h1(50, 10, _sectionTitle),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: AnimatedCustomList(
                fromTop: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15),
                initialDelay: 500,
                direction: Axis.vertical,
                height: 0,
                items: _listEntries,
              ),
            )
          ],
        ));
  }

  Widget _flutterContent() {
    return _section(_keys[0], '/assets/AppLocalizations.of(context)..png',
        AppLocalizations.of(context).flutterName, [
      Entry(
        title: AppLocalizations.of(context).flutterContent3Title,
        description: AppLocalizations.of(context).flutterContent3Subtitle,
        links: const [],
        tecnologies: '',
        images: [
          CustomImages(
              '/assets/photos/flutter/web_curriculum/preview_1.png',
              AppLocalizations.of(context).flutterContent3Image1Title,
              AppLocalizations.of(context).flutterContent3Image1Description),
          CustomImages(
              '/assets/photos/flutter/web_curriculum/preview_2.png',
              AppLocalizations.of(context).flutterContent3Image2Title,
              AppLocalizations.of(context).flutterContent3Image2Description),
          CustomImages(
              '/assets/photos/flutter/web_curriculum/preview_3.png',
              AppLocalizations.of(context).flutterContent3Image3Title,
              AppLocalizations.of(context).flutterContent3Image3Description),
        ],
        imageSize: landscape,
      ),
      Entry(
        title: AppLocalizations.of(context).flutterContent2Title,
        description: AppLocalizations.of(context).flutterContent2Subtitle,
        links: [
          CustomHref(
              uri: Uri(
                scheme: 'https',
                host: 'www.aiju.es',
                path: '/proyectos/cloud-api-sobre-inteligencia-artificial/',
              ),
              text: AppLocalizations.of(context).flutterContent2UrlText1),
          CustomHref(
              uri: Uri(
                scheme: 'https',
                host: 'www.aiju.es',
                path: '/proyectos/inteligencia-artificial-multisectorial/',
              ),
              text: AppLocalizations.of(context).flutterContent2UrlText2),
          CustomHref(
              uri: Uri(
                scheme: 'https',
                host: 'www.aiju.es',
                // path:
                //     '/proyectos/inteligencia-artificial-multisectorial/',
              ),
              text: AppLocalizations.of(context).flutterContent2UrlText3)
        ],
        tecnologies: AppLocalizations.of(context).flutterContent2Tecnologies,
        images: [
          CustomImages(
            '/assets/photos/flutter/aiju_platform/login.png',
            AppLocalizations.of(context).flutterContent2Image1Title,
            AppLocalizations.of(context).flutterContent2Image1Description,
          ),
          CustomImages(
              '/assets/photos/flutter/aiju_platform/init.png',
              AppLocalizations.of(context).flutterContent2Image2Title,
              AppLocalizations.of(context).flutterContent2Image2Description),
          CustomImages(
              '/assets/photos/flutter/aiju_platform/init_2.png',
              AppLocalizations.of(context).flutterContent2Image3Title,
              AppLocalizations.of(context).flutterContent2Image3Description),
          CustomImages(
              '/assets/photos/flutter/aiju_platform/chat_bot_detail.png',
              AppLocalizations.of(context).flutterContent2Image4Title,
              AppLocalizations.of(context).flutterContent2Image4Description),
          CustomImages(
              '/assets/photos/flutter/aiju_platform/image_recognition.png',
              AppLocalizations.of(context).flutterContent2Image5Title,
              AppLocalizations.of(context).flutterContent2Image5Description),
          CustomImages(
              '/assets/photos/flutter/aiju_platform/feeling_recognition.png',
              AppLocalizations.of(context).flutterContent2Image6Title,
              AppLocalizations.of(context).flutterContent2Image6Description),
          CustomImages(
              '/assets/photos/flutter/aiju_platform/google_ai_recognition_2021.png',
              AppLocalizations.of(context).flutterContent2Image7Title,
              AppLocalizations.of(context).flutterContent2Image7Description),
          CustomImages(
              '/assets/photos/flutter/aiju_platform/demo_info.png',
              AppLocalizations.of(context).flutterContent2Image8Title,
              AppLocalizations.of(context).flutterContent2Image8Description),
          CustomImages(
              '/assets/photos/flutter/aiju_platform/proyect_structure.png',
              AppLocalizations.of(context).flutterContent2Image9Title,
              AppLocalizations.of(context).flutterContent2Image9Description),
        ],
        imageSize: landscape,
      ),
      Entry(
        title: AppLocalizations.of(context).flutterContent1Title,
        description: AppLocalizations.of(context).flutterContent1Subtitle,
        links: [
          CustomHref(
              uri: Uri(
                  scheme: 'https',
                  host: 'play.google.com',
                  path: '/store/apps/details',
                  queryParameters: {
                    'id': 'com.listnology.shoppinglist',
                    'hl': 'es_419',
                    'gl': 'US'
                  }),
              //=US
              text: AppLocalizations.of(context).flutterContent1UrlText1),
        ],
        tecnologies: AppLocalizations.of(context).flutterContent1Tecnologies,
        images: [
          CustomImages(
              '/assets/photos/flutter/listnology/shopping_list.png',
              AppLocalizations.of(context).flutterContent1Image1Title,
              AppLocalizations.of(context).flutterContent1Image1Description),
          CustomImages(
              '/assets/photos/flutter/listnology/categories.png',
              AppLocalizations.of(context).flutterContent1Image2Title,
              AppLocalizations.of(context).flutterContent1Image2Description),
          CustomImages(
              '/assets/photos/flutter/listnology/create_share.png',
              AppLocalizations.of(context).flutterContent1Image3Title,
              AppLocalizations.of(context).flutterContent1Image3Description),
        ],
        imageSize: portrait,
      ),
    ]);
  }

  Widget _unityContent() {
    return _section(
        _keys[1], '/assets/icons/unity.png', AppLocalizations.of(context).unityName, [
      Entry(
          title: AppLocalizations.of(context).unityContent7Title,
          description: AppLocalizations.of(context).unityContent7Subtitle,
          links: [
            CustomHref(
                uri: Uri(
                  scheme: 'https',
                  host:
                      'play.google.com', // path: 'store/apps/details',// queryParameters: queryParameters3
                ),
                text: AppLocalizations.of(context).unityContent7UrlText1)
          ],
          tecnologies: AppLocalizations.of(context).unityContent7Tecnologies,
          images: [
            CustomImages(
                '/assets/photos/unity/intelect/preview_1.png',
                AppLocalizations.of(context).unityContent7Image1Title,
                AppLocalizations.of(context).unityContent7Image1Description),
            CustomImages(
                '/assets/photos/unity/intelect/preview_2.png',
                AppLocalizations.of(context).unityContent7Image2Title,
                AppLocalizations.of(context).unityContent7Image2Description),
            CustomImages(
                '/assets/photos/unity/intelect/preview_3.png',
                AppLocalizations.of(context).unityContent7Image3Title,
                AppLocalizations.of(context).unityContent7Image3Description),
          ],
          imageSize: portrait),
      Entry(
          title: AppLocalizations.of(context).unityContent6Title,
          description: AppLocalizations.of(context).unityContent6Subtitle,
          links: [
            CustomHref(
                uri: Uri(
                    scheme: 'https',
                    host: 'play.google.com',
                    path: 'store/apps/details',
                    queryParameters: {'id': 'com.laimprentacg.dulk'}),
                text: AppLocalizations.of(context).unityContent6UrlText1)
          ],
          tecnologies: AppLocalizations.of(context).unityContent6Tecnologies,
          images: [
            CustomImages(
                '/assets/photos/unity/dulk/preview_1.png',
                AppLocalizations.of(context).unityContent6Image1Title,
                AppLocalizations.of(context).unityContent6Image1Description),
            CustomImages(
                '/assets/photos/unity/dulk/preview_2.png',
                AppLocalizations.of(context).unityContent6Image2Title,
                AppLocalizations.of(context).unityContent6Image2Description),
            CustomImages(
                '/assets/photos/unity/dulk/preview_3.png',
                AppLocalizations.of(context).unityContent6Image3Title,
                AppLocalizations.of(context).unityContent6Image3Description),
          ],
          imageSize: portrait),
      Entry(
        title: AppLocalizations.of(context).unityContent5Title,
        description: AppLocalizations.of(context).unityContent5Subtitle,
        links: const [],
        tecnologies: AppLocalizations.of(context).unityContent5Tecnologies,
        images: [
          CustomImages(
              '/assets/photos/unity/app_emotions/preview_3.png',
              AppLocalizations.of(context).unityContent5Image1Title,
              AppLocalizations.of(context).unityContent5Image1Description),
          CustomImages(
              '/assets/photos/unity/app_emotions/preview_1.png',
              AppLocalizations.of(context).unityContent5Image2Title,
              AppLocalizations.of(context).unityContent5Image2Description),
          CustomImages(
              '/assets/photos/unity/app_emotions/preview_2.png',
              AppLocalizations.of(context).unityContent5Image3Title,
              AppLocalizations.of(context).unityContent5Image3Description),
        ],
        imageSize: landscape,
      ),
      Entry(
          title: AppLocalizations.of(context).unityContent4Title,
          description: AppLocalizations.of(context).unityContent4Subtitle,
          links: [
            CustomHref(
                uri: Uri.parse('https://youtu.be/8xoEKQhVNn0'),
                text: AppLocalizations.of(context).unityContent4UrlText1),
            CustomHref(
                uri: Uri(
                    scheme: 'https',
                    host: 'play.google.com',
                    path: 'store/apps/details',
                    queryParameters: {'id': 'com.j3.ClipAR'}),
                text: AppLocalizations.of(context).unityContent4UrlText2)
          ],
          tecnologies: AppLocalizations.of(context).unityContent4Tecnologies,
          images: [
            CustomImages(
                '/assets/photos/unity/clips_ar/preview_2.png',
                AppLocalizations.of(context).unityContent4Image1Title,
                AppLocalizations.of(context).unityContent4Image1Description),
            CustomImages(
                '/assets/photos/unity/clips_ar/preview_3.png',
                AppLocalizations.of(context).unityContent4Image2Title,
                AppLocalizations.of(context).unityContent4Image2Description),
            CustomImages(
                '/assets/photos/unity/clips_ar/preview_1.png',
                AppLocalizations.of(context).unityContent4Image3Title,
                AppLocalizations.of(context).unityContent4Image3Description),
          ],
          imageSize: portrait),
      Entry(
          title: AppLocalizations.of(context).unityContent3Title,
          description: AppLocalizations.of(context).unityContent3Subtitle,
          links: [
            CustomHref(
                uri: Uri.parse(
                    'https://cadenaser.com/emisora/2020/01/06/radio_alicante/1578304065_069723.html'),
                text: AppLocalizations.of(context).unityContent3UrlText1),
            CustomHref(
                uri: Uri(
                    scheme: 'https',
                    host: 'www.youtube.com',
                    path: 'watch',
                    queryParameters: {'v': '7gP5xETRlEs'}),
                text: AppLocalizations.of(context).unityContent3UrlText2)
          ],
          tecnologies: AppLocalizations.of(context).unityContent3Tecnologies,
          images: [
            CustomImages(
                '/assets/photos/unity/unity_games_aiju/tambor.png',
                AppLocalizations.of(context).unityContent3Image1Title,
                AppLocalizations.of(context).unityContent3Image1Description),
            CustomImages(
                '/assets/photos/unity/unity_games_aiju/puzzles_2D.png',
                AppLocalizations.of(context).unityContent3Image2Title,
                AppLocalizations.of(context).unityContent3Image2Description),
            CustomImages(
                '/assets/photos/unity/unity_games_aiju/baby_susu.png',
                AppLocalizations.of(context).unityContent3Image3Title,
                AppLocalizations.of(context).unityContent3Image3Description),
            CustomImages(
                '/assets/photos/unity/unity_games_aiju/bike.png',
                AppLocalizations.of(context).unityContent3Image4Title,
                AppLocalizations.of(context).unityContent3Image4Description),
            CustomImages(
                '/assets/photos/unity/unity_games_aiju/emotions.png',
                AppLocalizations.of(context).unityContent3Image5Title,
                AppLocalizations.of(context).unityContent3Image5Description),
            CustomImages(
                '/assets/photos/unity/unity_games_aiju/paola_reina.png',
                AppLocalizations.of(context).unityContent3Image6Title,
                AppLocalizations.of(context).unityContent3Image6Description),
            CustomImages(
                '/assets/photos/unity/unity_games_aiju/puzzles_3D.png',
                AppLocalizations.of(context).unityContent3Image7Title,
                AppLocalizations.of(context).unityContent3Image7Description),
            CustomImages(
                '/assets/photos/unity/unity_games_aiju/puzzles_3D_2.png',
                AppLocalizations.of(context).unityContent3Image8Title,
                AppLocalizations.of(context).unityContent3Image8Description),
            CustomImages(
                '/assets/photos/unity/unity_games_aiju/tambor_v2.png',
                AppLocalizations.of(context).unityContent3Image9Title,
                AppLocalizations.of(context).unityContent3Image9Description),
          ],
          imageSize: landscape),
      Entry(
          title: AppLocalizations.of(context).unityContent2Title,
          description: AppLocalizations.of(context).unityContent2Subtitle,
          links: [
            CustomHref(
                uri: Uri.parse('https://www.youtube.com/watch?v=kjnKK92kBfw'),
                text: AppLocalizations.of(context).unityContent2UrlText1),
            CustomHref(
                uri: Uri(
                    scheme: 'https',
                    host: 'play.google.com',
                    path: 'store/apps/details',
                    queryParameters: {'id': 'com.j3.samtsudoe'}),
                text: AppLocalizations.of(context).unityContent2UrlText2)
          ],
          tecnologies: AppLocalizations.of(context).unityContent2Tecnologies,
          images: [
            CustomImages(
                '/assets/photos/unity/samt_sudoe/preview_1.png',
                AppLocalizations.of(context).unityContent2Image1Title,
                AppLocalizations.of(context).unityContent2Image1Description),
            CustomImages(
                '/assets/photos/unity/samt_sudoe/preview_2.png',
                AppLocalizations.of(context).unityContent2Image2Title,
                AppLocalizations.of(context).unityContent2Image2Description),
            CustomImages(
                '/assets/photos/unity/samt_sudoe/preview_3.png',
                AppLocalizations.of(context).unityContent2Image3Title,
                AppLocalizations.of(context).unityContent2Image3Description),
          ],
          imageSize: landscape),
      Entry(
          title: AppLocalizations.of(context).unityContent1Title,
          description: AppLocalizations.of(context).unityContent1Subtitle,
          links: [
            CustomHref(
                uri: Uri(
                    scheme: 'https',
                    path: 'prezi.com/view/xvHj7gW5UaQEfnYatchS/'),
                text: AppLocalizations.of(context).unityContent1UrlText1)
          ],
          tecnologies: AppLocalizations.of(context).unityContent1Tecnologies,
          images: [
            CustomImages(
                '/assets/photos/unity/tranquill_app/preview_1.png',
                AppLocalizations.of(context).unityContent1Image1Title,
                AppLocalizations.of(context).unityContent1Image1Description),
            CustomImages(
                '/assets/photos/unity/tranquill_app/preview_2.png',
                AppLocalizations.of(context).unityContent1Image2Title,
                AppLocalizations.of(context).unityContent1Image2Description),
            CustomImages(
                '/assets/photos/unity/tranquill_app/preview_3.png',
                AppLocalizations.of(context).unityContent1Image3Title,
                AppLocalizations.of(context).unityContent1Image3Description),
          ],
          imageSize: landscape)
    ]);
  }

  Widget _solidityContent() {
    return _section(
      _keys[2],
      '/assets/icons/solidity.png',
      AppLocalizations.of(context).solidityName,
      [
        Entry(
          title: AppLocalizations.of(context).solidityContent1Title,
          description: AppLocalizations.of(context).solidityContent1Subtitle,
          links: const [],
          tecnologies: AppLocalizations.of(context).solidityContent1Tecnologies,
          images: [
            CustomImages(
                '/assets/photos/solidity/fuguland/fugus.png',
                AppLocalizations.of(context).solidityContent1Image1Title,
                AppLocalizations.of(context).solidityContent1Image1Description),
            CustomImages(
                '/assets/photos/solidity/fuguland/whitepaper_pvp.png',
                AppLocalizations.of(context).solidityContent1Image2Title,
                AppLocalizations.of(context).solidityContent1Image2Description),
            CustomImages(
                '/assets/photos/solidity/fuguland/contract.png',
                 AppLocalizations.of(context).solidityContent1Image3Title,
                AppLocalizations.of(context).solidityContent1Image3Description),
          ],
          imageSize: landscape,
        ),
      ],
    );
  }
}

abstract class AdaptiveTextSize {
  double getadaptiveTextSize(BuildContext context, dynamic value) {
    // 720 is medium screen height
    return (value / 720) *
        (currentDirection(context) == Axis.vertical
            ? MediaQuery.of(context).size.height
            : MediaQuery.of(context).size.width * 0.5);
  }

  Axis currentDirection(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width >= 1500;
    return isScreenWide ? Axis.horizontal : Axis.vertical;
  }
}

class Entry extends StatelessWidget with AdaptiveTextSize {
  final String title;
  final String description;
  final List<CustomHref> links;
  final String tecnologies;
  final List<CustomImages> images;
  final Size imageSize;
  const Entry(
      {Key? key,
      required this.title,
      required this.description,
      required this.links,
      required this.tecnologies,
      required this.images,
      required this.imageSize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _title(context),
        _subtitle(context),
        _tecnologies(context),
        _links(context),
        _images(context)
      ],
    );
  }

  Widget _title(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Text(title,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontFamily: 'Boogaloo',
            fontSize: getadaptiveTextSize(context, 26),
          )),
    );
  }

  Widget _subtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 25.0),
      child: Text(description,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Questrial',
            fontSize: getadaptiveTextSize(context, 13),
          )),
    );
  }

  Widget _links(BuildContext context) {
    if (links.isEmpty) return Container();
    Axis _currentDirection = currentDirection(context);
    return Padding(
        padding: const EdgeInsets.only(top: 15, left: 30),
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: _currentDirection,
          children: [
            Text(AppLocalizations.of(context).linksText,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Questrial',
                    fontSize: getadaptiveTextSize(context, 13))),
            Flex(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              direction: _currentDirection,
              children: links,
            )
          ],
        ));
  }

  Widget _tecnologies(BuildContext context) {
    if (tecnologies.isEmpty) return Container();
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Flex(
        crossAxisAlignment: isVertical(context)
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        direction: currentDirection(context),
        children: [
          Text(AppLocalizations.of(context).tecnologiesText,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Questrial',
                  fontSize: getadaptiveTextSize(context, 13),
                  overflow: TextOverflow.clip)),
          Padding(
            padding: isVertical(context)
                ? const EdgeInsets.only(left: 8, top: 0)
                : const EdgeInsets.only(left: 26, top: 15),
            child: Text(tecnologies,
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Questrial',
                    fontSize: getadaptiveTextSize(context, 13))),
          ),
        ],
      ),
    );
  }

  Widget _images(BuildContext context) {
    List<Widget> childs = [];
    List<Widget> provisionalChilds = [];
    int imagesProcessed = 0;
    int imagesPerRow = 3;

    for (var i = 0; i < images.length; i++) {
      provisionalChilds.add(Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          images[i].path.isEmpty
              ? Container()
              : CustomFullScreenWidget(
                  size: imageSize,
                  path: images[i].path,
                  backgroundColor: Theme.of(context).backgroundColor,
                ),
          images[i].description.isEmpty
              ? Container()
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SizedBox(
                      width: 400,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            text: images[i].descriptionTitle,
                            style: TextStyle(
                                height: 1.2,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Questrial',
                                fontSize: getadaptiveTextSize(context, 12)),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' ' + images[i].description,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      color: Colors.white,
                                      fontFamily: 'Questrial',
                                      fontSize:
                                          getadaptiveTextSize(context, 12))),
                            ],
                          ),
                        ),
                      )),
                ),
        ],
      ));
      imagesProcessed++;
      if (imagesProcessed >= imagesPerRow) {
        childs.add(Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
          child: Flex(
            crossAxisAlignment: CrossAxisAlignment.center,
            direction: currentDirection(context),
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: provisionalChilds,
          ),
        ));
        provisionalChilds = [];
        imagesProcessed = 0;
      }
    }
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: childs,
      ),
    );
  }

  bool isVertical(BuildContext context) {
    return currentDirection(context) == Axis.horizontal;
  }
}

class CustomHref extends StatelessWidget with AdaptiveTextSize {
  final Uri uri;
  final String text;

  CustomHref({Key? key, required this.uri, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool notMobile = currentDirection(context) == Axis.horizontal;
    return Padding(
      padding: EdgeInsets.only(
          left: notMobile ? 10 : 25,
          top: notMobile ? 0 : 15,
          bottom: notMobile ? 0 : 5),
      child: InkWell(
        onTap: () => helper.launchURL(uri),
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontFamily: 'Questrial',
            fontSize: getadaptiveTextSize(context, 13),
            color: Theme.of(context).primaryColor.withRed(250),
          ),
        ),
      ),
    );
  }
}

class CustomImages {
  final String path;
  final String descriptionTitle;
  final String description;

  const CustomImages(this.path, this.descriptionTitle, this.description);
}
