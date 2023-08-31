import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/widget/custom_button.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';
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
  final pdf = pw.Document();
  late File? file = null;

  writeOnPDF() async {
    final font = await rootBundle.load("assets/open-sans.ttf");
    final ttf = pw.Font.ttf(font);

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(
                  child: pw.Text(widget.title,
                      style: pw.TextStyle(font: ttf, fontSize: 25)),
                ),
                pw.SizedBox(),
                pw.Text(widget.description,
                    style: pw.TextStyle(font: ttf, fontSize: 20)),
                pw.SizedBox(),
                pw.Text("${widget.content.substring(0, widget.content.length - 15)}\n\n ${widget.description}...",
                    style: pw.TextStyle(font: ttf, fontSize: 20)),
              ]);
        }));
  }

  Future savePDF() async {
    final directory = await getExternalStorageDirectory();
    // String documentPath = documentDirectory.path;

    final file1 = File("${directory?.path}/${DateTime.now()}new.pdf");

    file1.writeAsBytes(await pdf.save());

    setState(() {
      file = file1;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(widget.publishdate.toString());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image(
                image: NetworkImage(widget.image),
                fit: BoxFit.cover,
              ),
              Container(
                width: size.width,
                  height: size.height,
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
                      Row
                        (
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
                          Container(
                            child: Text(timeago.format(dateTime),
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Description",
                          style: GoogleFonts.roboto(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                          "${widget.description}\n\n${widget.content.substring(0, widget.content.length - 15)}....",
                          style: GoogleFonts.roboto(
                              fontSize: 20)),
                      const SizedBox(
                        height: 70,
                      ),

                      CustomButton(
                          onPressed: () {

                            launchUrl(Uri.parse(widget.url),
                                mode: LaunchMode.inAppWebView);

                          },
                          text: " Read Full Article "),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomButton(
                          onPressed: () {
                            writeOnPDF();
                            savePDF();
                          },
                          text: "Save as PDF ")
                    ],
                  )),
              Container(
                margin: const EdgeInsets.only(top: 170, left: 330),
                child: FloatingActionButton(
                  backgroundColor: Colors.indigo,
                  onPressed: () async{

                    await Share.share(widget.url);

                  },
                  child: const Icon(Icons.share),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
