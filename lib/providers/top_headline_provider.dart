import 'package:flutter/material.dart';

import 'package:news_app/controller/headlines_controller.dart';

import '../model/headlines_model.dart';

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
}
