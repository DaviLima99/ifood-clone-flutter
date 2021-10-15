import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_theme.dart';
import 'package:ifood/views/content/content_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IFood Flutter Clone',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const ContentPage(),
    );
  }
}
