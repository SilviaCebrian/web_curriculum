import 'package:flutter/material.dart';
import 'package:curriculum_web/widgets/Header/custom_drawer.dart';
import 'package:curriculum_web/widgets/Header/custom_tab.dart';
import '../views/base_view.dart';
import '../views/desktop_view.dart';
import '../views/mobile_view.dart';
import '../widgets/Tabs/home_tab.dart';
import '../widgets/Tabs/about_me_tab.dart';
import '../widgets/Tabs/proyects_tab.dart';
import '../widgets/Tabs/contact_tab.dart';
import 'package:curriculum_web/utils/helpers.dart' as helper;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController tabController;
  late double screenHeight, screenWidth, topPadding, bottomPadding;
  late List<ContentView> contentViews;
  late int currentView = -1;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    contentViews = [
      ContentView(
          tab: CustomTab(
              title: AppLocalizations.of(context)!.home.toUpperCase(),
              position: 0),
          content: const HomeTab()),
          // content: const AboutMeTab()),
      ContentView(
          tab: CustomTab(
              title: AppLocalizations.of(context)!.aboutMe.toUpperCase(),
              position: 1),
          content: const AboutMeTab()),
      ContentView(
          tab: CustomTab(
              title: AppLocalizations.of(context)!.projects.toUpperCase(),
              position: 2),
          content: const ProyectsTab()),
      ContentView(
          tab: CustomTab(
              title: AppLocalizations.of(context)!.contact.toUpperCase(),
              position: 3),
          content: const ContactTab()),
    ];

    tabController = TabController(length: contentViews.length, vsync: this);
    tabController.addListener(() {
      if (tabController.animation!.isCompleted) {
        currentView = tabController.index;
        // Your code goes here.
        // To get index of current tab use tabController.index
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentView >= 0) tabController.animateTo(currentView);
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    topPadding = screenHeight * 0.01;
    bottomPadding = screenHeight * 0.01;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SideLayout(),
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.only(bottom: bottomPadding, top: topPadding),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    if (constraints.maxWidth < 1500) {
                      return MobileView(
                          controller: tabController,
                          width: screenWidth,
                          scaffoldKey: scaffoldKey,
                          tabs: contentViews);
                    } else {
                      return DesktopView(
                        height: screenHeight * 0.85,
                        controller: tabController,
                        tabs: contentViews,
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: CustomDrawer(
        controller: tabController,
        tabs: contentViews,
        height: screenHeight,
      ),
      key: scaffoldKey,
    );
  }
}

class SideLayout extends StatelessWidget {
  const SideLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: Theme.of(context).primaryColor.withAlpha(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          SizedBox(height: 50),
          ButtonLeftPanel(
              asyncFunc: helper.linkedin, url: 'assets/icons/linkedin.png'),
          SizedBox(
            height: 50,
          ),
          ButtonLeftPanel(
              asyncFunc: helper.github, url: 'assets/icons/github.png'),
        ],
      ),
    );
  }
}

class ButtonLeftPanel extends StatelessWidget {
  const ButtonLeftPanel({Key? key, required this.asyncFunc, required this.url})
      : super(key: key);
  final void Function() asyncFunc;
  final String url;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Image(
        image: AssetImage(
          url,
        ),
        width: 30,
        height: 30,
      ),
      onTap: () => asyncFunc(),
    );
  }
}
