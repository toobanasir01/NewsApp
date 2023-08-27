import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class Details extends StatefulWidget {
  const Details({
    super.key,
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.image,
    required this.content,
    required this.publishdate,
    required this.url,
  });

  final String name;
  final String author;
  final String title;
  final String description;
  final String image;
  final String content;
  final String publishdate;
  final String url;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(widget.publishdate.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Expanded(
            child: Stack(
              children: [
                Image(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.cover,
                ),
                Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    margin: const EdgeInsets.only(top: 200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(widget.title,
                            style: GoogleFonts.roboto(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://img.freepik.com/premium-vector/portrait-caucasian-woman-avatar-female-person-vector-icon-adult-flat-style-headshot_605517-25.jpg?w=2000"),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Text(widget.author,
                                        style: GoogleFonts.roboto(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                            Text(timeago.format(dateTime),
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text("Description",
                            style: GoogleFonts.roboto(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(widget.content,
                            style: GoogleFonts.roboto(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 170, left: 330),
                  child: FloatingActionButton(
                    backgroundColor: Colors.indigo,
                    onPressed: () {
                      launchUrl(Uri.parse(widget.url),
                          mode: LaunchMode.inAppWebView);
                    },
                    child: const Icon(Icons.ac_unit_outlined),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
