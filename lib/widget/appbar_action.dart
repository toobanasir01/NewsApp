import 'package:flutter/material.dart';
import 'package:news_app/providers/top_headline_provider.dart';
import 'package:provider/provider.dart';
class CustomAction extends StatelessWidget {
  const CustomAction({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<TopHeadlineProvider>(
          builder: (_, value, __) => PopupMenuButton(

            color: Colors.white,
            itemBuilder: (context) => <PopupMenuEntry<FilterList>>[
              const PopupMenuItem<FilterList>(
                  value: FilterList.aljazeera,
                  child: Text("Al Jazeera")),
              const PopupMenuItem<FilterList>(
                  value: FilterList.cnn, child: Text("CNN")),
              const PopupMenuItem<FilterList>(
                  value: FilterList.arynews, child: Text("Ary News")),
              const PopupMenuItem<FilterList>(
                  value: FilterList.cbcnews, child: Text(" CBC News")),
              const PopupMenuItem<FilterList>(
                  value: FilterList.argaam, child: Text(" Argaam News")),
              const PopupMenuItem<FilterList>(
                  value: FilterList.bbcsport, child: Text(" BBC")),

            ],
            onSelected: (item) {
              value.addCategory(item.name);
            },
          ),
        );
  }
}
