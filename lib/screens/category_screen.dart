import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/providers/category_provider.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/widget/list_tile.dart';
import 'package:news_app/widget/drawer_widget.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryname;
  const CategoryScreen({super.key, required this.categoryname});

  @override
  State<CategoryScreen> createState() => _CategoryScreen();
}

class _CategoryScreen extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        drawer: SideBar(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.indigo,
          centerTitle: true,
          title: Text(
            widget.categoryname,
            style: GoogleFonts.anton(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: Consumer<CategoryProvider>(builder: (_, value, __) {
            if (value.isloading) {
              return Center(child: CircularProgressIndicator());
            }

            final category = value.ArticleList;
            return ListView.separated(
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  return NewsTile(details: category[index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox();
                },
                itemCount: value.ArticleList.length);
          }),
        ),
      ),
      onWillPop: () async {
        return await Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
    );
  }
}
