import 'package:flutter/material.dart';
import 'package:flutteruniverse/constants.dart';
import 'package:flutteruniverse/models/data.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsCreen extends StatefulWidget {
  const DetailsCreen({Key? key, required this.planetInfo}) : super(key: key);
  final PlanetInfo planetInfo;
  @override
  _DetailsCreenState createState() => _DetailsCreenState();
}

class _DetailsCreenState extends State<DetailsCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 35,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 10,
                      child: Hero(
                        tag: widget.planetInfo.iconImage,
                        child: Image.asset(
                          widget.planetInfo.iconImage,
                          height: 270,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15,
                      left: 20,
                      child: Text(
                        widget.planetInfo.position.toString(),
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 220,
                          color: primaryTextColor.withOpacity(0.08),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.planetInfo.name,
                      style: GoogleFonts.ubuntu(
                        fontSize: 56,
                        color: primaryTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Solar System',
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w300,
                        fontSize: 31,
                        color: primaryTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.planetInfo.description,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.ubuntu(
                        fontSize: 20,
                        color: contentTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Gallery',
                    style: GoogleFonts.ubuntu(
                      fontSize: 25,
                      color: const Color(0xFF47455f),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 250,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.planetInfo.images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(
                            widget.planetInfo.images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
