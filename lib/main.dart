import "package:flutter/material.dart";
import 'package:news_app/providers/category_provider.dart';
import 'package:news_app/providers/top_headline_provider.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/splash_screen.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: ((context) => CategoryProvider())),
        ChangeNotifierProvider(create: ((context) => TopHeadlineProvider())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black)),
          primaryColor: Colors.white70,
        ),
        home: const NewsSplashScreen(),
      ),
    );
  }
}
