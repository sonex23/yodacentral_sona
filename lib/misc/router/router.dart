import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yodacentral_sona/feature/financing_lead/registration_number_page.dart';
import 'package:yodacentral_sona/feature/home/home_page.dart';
import 'package:yodacentral_sona/misc/utils/router_constant.dart';

class MainRouter {
  late final router = GoRouter(
    initialLocation: homeRouteName,
    routes: [
      GoRoute(
        path: homeRouteName,
        name: homeRouteName,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const HomePage(),
        ),
      ),
      GoRoute(
        path: registrationNumberRouteName,
        name: registrationNumberRouteName,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const RegistrationNumberPage(),
        ),
      ),
    ],
  );
}
