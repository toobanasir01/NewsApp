import 'package:flutter/material.dart';
import 'package:news_app/providers/category_provider.dart';
import 'package:provider/provider.dart';
import 'package:news_app/controller/auth_controller.dart';
import 'package:news_app/screens/login_screen.dart';

class SideBar extends StatelessWidget {
  final style = Colors.white;
  final AuthController _authCtrl = AuthController();

  SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<CategoryProvider>(context, listen: false);
    return SafeArea(
        child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Drawer(
              width: 150,
              elevation: 10,
              backgroundColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                  side: BorderSide(width: 1.8, color: Colors.indigo),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  )),
              child: Consumer<CategoryProvider>(builder: (_, value, __) {
                return ListView(
                  children: [
                    ListTile(
                      onTap: () {
                        value.selectedCategory = Categorylist.home;
                        value.addList(context);
                      },
                      title: Text(
                        "Home",
                        style: value.selectedCategory == Categorylist.home
                            ? const TextStyle(color: Colors.white)
                            : const TextStyle(
                                color: Color.fromARGB(255, 34, 63, 129)),
                      ),
                      tileColor: value.selectedCategory == Categorylist.home
                          ? Colors.indigo.withOpacity(0.7)
                          : Colors.white.withOpacity(0.7),
                    ),
                    ListTile(
                      title: Text(
                        "General",
                        style: value.selectedCategory == Categorylist.general
                            ? const TextStyle(color: Colors.white)
                            : const TextStyle(
                                color: Color.fromARGB(255, 34, 63, 129)),
                      ),
                      onTap: () {
                        value.selectedCategory = Categorylist.general;
                        value.addList(context);
                      },
                      tileColor: value.selectedCategory == Categorylist.general
                          ? Colors.indigo.withOpacity(0.7)
                          : Colors.white.withOpacity(0.7),
                    ),
                    ListTile(
                      title: Text(
                        "Business",
                        style: value.selectedCategory == Categorylist.business
                            ? const TextStyle(color: Colors.white)
                            : const TextStyle(
                                color: Color.fromARGB(255, 34, 63, 129)),
                      ),
                      onTap: () {
                        value.selectedCategory = Categorylist.business;
                        value.addList(context);
                      },
                      tileColor: value.selectedCategory == Categorylist.business
                          ? Colors.indigo.withOpacity(0.7)
                          : Colors.white.withOpacity(0.7),
                    ),
                    ListTile(
                      title: Text(
                        "Entertainment",
                        style:
                            value.selectedCategory == Categorylist.entertainment
                                ? const TextStyle(color: Colors.white)
                                : const TextStyle(
                                    color: Color.fromARGB(255, 34, 63, 129)),
                      ),
                      onTap: () {
                        value.selectedCategory = Categorylist.entertainment;
                        value.addList(context);
                      },
                      tileColor:
                          value.selectedCategory == Categorylist.entertainment
                              ? Colors.indigo.withOpacity(0.7)
                              : Colors.white.withOpacity(0.7),
                    ),
                    ListTile(
                      title: Text(
                        "Health",
                        style: value.selectedCategory == Categorylist.health
                            ? const TextStyle(color: Colors.white)
                            : const TextStyle(
                                color: Color.fromARGB(255, 34, 63, 129)),
                      ),
                      onTap: () {
                        value.selectedCategory = Categorylist.health;
                        value.addList(context);
                      },
                      tileColor: value.selectedCategory == Categorylist.health
                          ? Colors.indigo.withOpacity(0.7)
                          : Colors.white.withOpacity(0.7),
                    ),
                    ListTile(
                      title: Text(
                        "Science",
                        style: value.selectedCategory == Categorylist.science
                            ? const TextStyle(color: Colors.white)
                            : const TextStyle(
                                color: Color.fromARGB(255, 34, 63, 129)),
                      ),
                      onTap: () {
                        value.selectedCategory = Categorylist.science;
                        value.addList(context);
                      },
                      tileColor: value.selectedCategory == Categorylist.science
                          ? Colors.indigo.withOpacity(0.7)
                          : Colors.white.withOpacity(0.7),
                    ),
                    ListTile(
                      title: Text(
                        "Sports",
                        style: value.selectedCategory == Categorylist.sports
                            ? const TextStyle(color: Colors.white)
                            : const TextStyle(
                                color: Color.fromARGB(255, 34, 63, 129)),
                      ),
                      onTap: () {
                        value.selectedCategory = Categorylist.sports;
                        value.addList(context);
                      },
                      tileColor: value.selectedCategory == Categorylist.sports
                          ? Colors.indigo.withOpacity(0.7)
                          : Colors.white.withOpacity(0.7),
                    ),
                    ListTile(
                      title: Text(
                        "Technology",
                        style: value.selectedCategory == Categorylist.technology
                            ? const TextStyle(color: Colors.white)
                            : const TextStyle(
                                color: Color.fromARGB(255, 34, 63, 129)),
                      ),
                      onTap: () {
                        value.selectedCategory = Categorylist.technology;
                        value.addList(context);
                      },
                      tileColor:
                          value.selectedCategory == Categorylist.technology
                              ? Colors.indigo.withOpacity(0.7)
                              : Colors.white.withOpacity(0.7),
                    ),


                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: Text(
                        "Log Out",
                        style: value.selectedCategory == Categorylist.logout
                            ? const TextStyle(color: Colors.white)
                            : const TextStyle(
                                color: Color.fromARGB(255, 34, 63, 129)),
                      ),
                      tileColor:
                          value.selectedCategory == Categorylist.logout
                              ? Colors.indigo.withOpacity(0.7)
                              : Colors.white.withOpacity(0.7),
                      onTap: () async {
                        await _authCtrl.logout(3);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                const LoginScreen())));
                      },
                    ),
                  ],
                );
              }),
            )));
  }
}
