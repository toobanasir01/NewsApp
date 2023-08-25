import 'package:flutter/material.dart';
import 'package:news_app/providers/category_provider.dart';
import 'package:provider/provider.dart';

class SideBar extends StatelessWidget {
   final style  = Colors.white;

  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<CategoryProvider>(context, listen: false);
    return SafeArea(
      child: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Drawer(

            width: 130,
            elevation: 10,

            backgroundColor: Colors.transparent,

            shape: const RoundedRectangleBorder(
                side: BorderSide(width: 1.2,color: Colors.indigo),
                borderRadius: BorderRadius.only(

                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12))),

            child: Consumer<CategoryProvider>(builder: (_, value, __) {
              return ListView(
                children: [
                  ListTile(


                      onTap: () {
                        value.selectedCategory = Categorylist.home;
                        value.addList(context);

                      },
                      title: Text(
                      "Home",style: value.selectedCategory == Categorylist.home
                        ?TextStyle(color: Colors.white)
                        :TextStyle(color: Color.fromARGB(255, 34, 63, 129)
                      ),
                      ),
                      tileColor: value.selectedCategory == Categorylist.home
                          ? Colors.blue.withOpacity(0.4)
                          : Colors.white.withOpacity(0.7),),
                  ListTile(

                      title: Text("General",
                        style: value.selectedCategory == Categorylist.general
                            ?TextStyle(color: Colors.white)
                            :TextStyle(color: Color.fromARGB(255, 34, 63, 129)
                        ),
                      ),
                      onTap: () {
                        value.selectedCategory = Categorylist.general;
                        value.addList(context);
                      },
                      tileColor: value.selectedCategory == Categorylist.general
                          ? Colors.blue.withOpacity(0.4)
                          : Colors.white.withOpacity(0.7),),
                  ListTile(

                      title: Text("Business",style: value.selectedCategory == Categorylist.business
                          ?TextStyle(color: Colors.white)
                          :TextStyle(color: Color.fromARGB(255, 34, 63, 129)
                      ),),
                      onTap: () {
                        value.selectedCategory = Categorylist.business;
                        value.addList(context);
                      },
                      tileColor: value.selectedCategory == Categorylist.business
                          ? Colors.blue.withOpacity(0.4)
                          : Colors.white.withOpacity(0.7),),
                  ListTile(

                      title: Text("Entertainment",style: value.selectedCategory == Categorylist.entertainment
                          ?TextStyle(color: Colors.white)
                          :TextStyle(color: Color.fromARGB(255, 34, 63, 129)
                      ),),
                      onTap: () {
                        value.selectedCategory = Categorylist.entertainment;
                        value.addList(context);
                      },
                      tileColor: value.selectedCategory == Categorylist.entertainment
                          ? Colors.blue.withOpacity(0.4)
                          : Colors.white.withOpacity(0.7),),


                  ListTile(

                      title:  Text("Health",style: value.selectedCategory == Categorylist.health
                          ?TextStyle(color: Colors.white)
                          :TextStyle(color: Color.fromARGB(255, 34, 63, 129)
                      ),),
                      onTap: () {
                        value.selectedCategory = Categorylist.health;
                        value.addList(context);
                      },
                      tileColor: value.selectedCategory == Categorylist.health
                          ? Colors.blue.withOpacity(0.4)
                          : Colors.white.withOpacity(0.7),),

                  ListTile(

                      title: Text("Science",style: value.selectedCategory == Categorylist.science
                          ?TextStyle(color: Colors.white)
                          :TextStyle(color: Color.fromARGB(255, 34, 63, 129)
                      ),),
                      onTap: () {
                        value.selectedCategory = Categorylist.science;
                        value.addList(context);
                      },
                      tileColor: value.selectedCategory == Categorylist.science
                          ? Colors.blue.withOpacity(0.4)
                          : Colors.white.withOpacity(0.7),),


                  ListTile(

                      title: Text("Sports",style: value.selectedCategory == Categorylist.sports
                          ?TextStyle(color: Colors.white)
                          :TextStyle(color: Color.fromARGB(255, 34, 63, 129)
                      ),),
                      onTap: () {
                        value.selectedCategory = Categorylist.sports;
                        value.addList(context);
                      },
                      tileColor: value.selectedCategory == Categorylist.sports
                          ? Colors.blue.withOpacity(0.4)
                          : Colors.white.withOpacity(0.7),),


                  ListTile(

                      title: Text("Technology",style: value.selectedCategory == Categorylist.technology
                          ?TextStyle(color: Colors.white)
                          :TextStyle(color: Color.fromARGB(255, 34, 63, 129)
                      ),),
                      onTap: () {
                        value.selectedCategory = Categorylist.technology;
                        value.addList(context);
                      },
                      tileColor: value.selectedCategory == Categorylist.technology
                          ? Colors.blue.withOpacity(0.4)
                          : Colors.white.withOpacity(0.7),),




                ],
              );
            })),
      ),
    );
  }
}
