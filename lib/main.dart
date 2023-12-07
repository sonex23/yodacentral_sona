import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yodacentral_sona/core/service/servive_locator.dart';
import 'package:yodacentral_sona/firebase_options.dart';
import 'package:yodacentral_sona/misc/router/router.dart';
import 'package:yodacentral_sona/misc/utils/palette.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUpServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: app<MainRouter>().router,
      title: 'Yodacentral Sona',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        typography: Typography(
          black: const TextTheme(
            displayLarge: TextStyle(
              fontFamily: 'Inter',
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Palette.gray900,
            ),
            displayMedium: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Palette.gray900,
            ),
            displaySmall: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Palette.gray900,
            ),
          ),
        ),
      ),
    );
  }
}
