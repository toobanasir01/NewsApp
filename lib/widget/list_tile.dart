import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/headlines_model.dart';
import 'package:news_app/screens/details_screen.dart';
import 'package:news_app/widget/custom_card_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsTile extends StatefulWidget {
  final Articles details;

  const NewsTile({
    super.key,
    required this.details,
  });

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(widget.details.publishedAt.toString());
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Details(
                      url: widget.details.url.toString(),
                      name: widget.details.source!.name.toString(),
                      author: widget.details.author.toString(),
                      title: widget.details.title.toString(),
                      description: widget.details.description.toString(),
                      image: widget.details.urlToImage.toString(),
                      content: widget.details.content.toString(),
                      publishdate: widget.details.publishedAt.toString(),
                    )));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width * 0.92,
            height: size.height * 0.35,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("${widget.details.urlToImage}"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  ContainerWiget(
                    width: size.width * 0.90,
                    height: size.height * 0.34,
                    color: Colors.black.withOpacity(0.25),
                    container: Container(),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Text(
                            "${widget.details.source!.name}",
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            width: 14,
                            height: 40,
                          ),
                          Text(timeago.format(dateTime),
                              style: GoogleFonts.questrial(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white)),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${widget.details.title}",
                            style: GoogleFonts.questrial(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
