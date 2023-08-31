import 'package:flutter/material.dart';

import 'package:news_app/controller/headlines_controller.dart';

import '../model/headlines_model.dart';

enum FilterList { argaam, aljazeera, cnn, arynews, bbcsport, cbcnews }

class TopHeadlineProvider extends ChangeNotifier {
  final _services = TopHeadline();
  bool loader = false;

  List<Articles> _topHeadline = [];

  List<Articles> get topheadline => _topHeadline;

  Future<void> getTopHeadline(String channe) async {
    loader = true;

    final response = await _services.getArticles2(channe);
    _topHeadline = response;
    loader = false;
    notifyListeners();
  }

  addCategory(String item) {
    if (FilterList.argaam.name == item) {
      String name = "argaam";
      getTopHeadline(name);
    }
    if (FilterList.aljazeera.name == item) {
      String name = "al-jazeera-english";
      getTopHeadline(name);
    }
    if (FilterList.cnn.name == item) {
      String name = "cnn";
      getTopHeadline(name);
    }
    if (FilterList.arynews.name == item) {
      String name = "ary-news";
      getTopHeadline(name);
    }
    if (FilterList.bbcsport.name == item) {
      String name = "bbc-sport";
      getTopHeadline(name);
    }
    if (FilterList.cbcnews.name == item) {
      String name = "cbc-news";
      getTopHeadline(name);
    }
  }
}
