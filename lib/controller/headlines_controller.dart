import 'dart:io';

import 'package:dio/dio.dart';

import '../model/headlines_model.dart';

class TopHeadline {
  final Dio dio = Dio();

  Future<List<Articles>> getArticles2(String channel) async {
    try {
      Response response = await dio.get(
          "https://newsapi.org/v2/top-headlines?sources=$channel&apiKey=8f56e2d78f1f42269f61abc655cd261a");
      if (response.statusCode == 200) {
        Map<String, dynamic> a = response.data;
        List<dynamic> body = a["articles"];

        List<Articles> articles =
            body.map((dynamic item) => Articles.fromJson(item)).toList();

        return articles;
      } else {
        throw Error;
      }
    } catch (error) {
      stdout.write(error);
      throw Error;
    }
  }
}

class Category {
  final Dio dio = Dio();

  Future<List<Articles>> getCategory(String category) async {
    Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=8f56e2d78f1f42269f61abc655cd261a");

    if (response.statusCode == 200) {
      Map<String, dynamic> a = response.data;
      List<dynamic> body = a["articles"];

      List<Articles> articles =
          body.map((dynamic item) => Articles.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Error");
    }
  }
}
