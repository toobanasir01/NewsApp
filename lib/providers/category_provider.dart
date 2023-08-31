import 'package:flutter/material.dart';

import 'package:news_app/controller/headlines_controller.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/login_screen.dart';

import '../model/headlines_model.dart';
import '../screens/category_screen.dart';

enum Categorylist {
  home,
  general,
  business,
  entertainment,
  health,
  science,
  sports,
  technology,
  logout
}

class CategoryProvider extends ChangeNotifier {
  final _service = Category();
  bool isloading = false;
  Categorylist? selectedCategory;

  List<Articles> _articleList = [];

  List<Articles> get articleList => _articleList;

  Future<void> getallarticles(String category1) async {
    isloading = true;

    final response = await _service.getCategory(category1);
    _articleList = response;
    isloading = false;
    notifyListeners();
  }

  addList(BuildContext context) {
    if (Categorylist.home == selectedCategory) {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const HomeScreen())));
    }
    if (Categorylist.general == selectedCategory) {
      getallarticles("general");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) =>
                  const CategoryScreen(categoryname: "General"))));
    }
    if (Categorylist.business == selectedCategory) {
      getallarticles("business");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) =>
                  const CategoryScreen(categoryname: "Business"))));
    }
    if (Categorylist.entertainment == selectedCategory) {
      getallarticles("entertainment");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) =>
                  const CategoryScreen(categoryname: "Entertainment"))));
    }
    if (Categorylist.health == selectedCategory) {
      getallarticles("health");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) =>
                  const CategoryScreen(categoryname: "Health"))));
    }
    if (Categorylist.sports == selectedCategory) {
      getallarticles("sports");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) =>
                  const CategoryScreen(categoryname: "Sports"))));
    }
    if (Categorylist.technology == selectedCategory) {
      getallarticles("technology");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) =>
                  const CategoryScreen(categoryname: "Technology"))));
    }
    if (Categorylist.science == selectedCategory) {
      getallarticles("science");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: ((context) =>
                  const CategoryScreen(categoryname: "Science"))));
    }
    if (Categorylist.logout == selectedCategory) {


    }
  }
}
