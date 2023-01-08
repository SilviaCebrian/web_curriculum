import 'package:flutter/material.dart';
import 'package:curriculum_web/theme/my_theme.dart';
import 'package:curriculum_web/pages/home_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
Future main() async {
  await dotenv.load(
    fileName: "dotenv",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Silvia Cebrián Ruiz',
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
         Locale('es', ''), // Spanish, no country code
      ],
      home: const HomePage(),
    );
  }
}
