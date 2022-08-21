import 'package:flutter/material.dart';
import 'package:quetos/config/routes/app_routes.dart';
import 'package:quetos/core/utils/app_strings.dart';

import 'core/utils/app_theme.dart';

class QuotesApp extends StatelessWidget {
  const QuotesApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      theme:appTheme(),
      routes: routes,
    );
  }
}
