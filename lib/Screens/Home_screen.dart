import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutteruniverse/Screens/Details_Screen.dart';
import 'package:flutteruniverse/constants.dart';
import 'package:flutteruniverse/models/data.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownValue = 'Solar System';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3, 0.7],
            colors: <Color>[
              gradientStartColor,
              gradientEndColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Explore',
                  style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.w700,
                      fontSize: 38,
                      color: Colors.white),
                ),
                DropdownButton<String>(
                  dropdownColor: Colors.blue,
                  value: dropdownValue,
                  icon: Image.asset('assets/images/drop_down_icon.png'),
                  iconSize: 24,
                  elevation: 16,
                  style: GoogleFonts.ubuntu(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  underline: SizedBox(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Solar System', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Container(
                  height: 470,
                  padding: const EdgeInsets.all(30),
                  child: Swiper(
                    duration: 500,
                    itemCount: planets.length,
                    itemWidth: MediaQuery.of(context).size.width - 2 * 70,
                    layout: SwiperLayout.STACK,
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        activeSize: 10,
                        space: 5,
                      ),
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 500),
                                  reverseTransitionDuration:
                                      const Duration(milliseconds: 500),
                                  pageBuilder: (context, animation,
                                          secondaryAnimtaion) =>
                                      FadeTransition(
                                        opacity: animation,
                                        child: DetailsCreen(
                                          planetInfo: planets[index],
                                        ),
                                      )));
                        },
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 100,
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(19),
                                  ),
                                  elevation: 8,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 70,
                                        ),
                                        Text(
                                          planets[index].name,
                                          style: GoogleFonts.ubuntu(
                                            color: Color(0xff47455f),
                                            fontSize: 40,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Solar System',
                                          style: GoogleFonts.ubuntu(
                                            color: primaryTextColor,
                                            fontSize: 23,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'Know more',
                                              style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 18,
                                                color: secondaryTextColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: secondaryTextColor,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              left: 0,
                              child: Hero(
                                tag: planets[index].iconImage,
                                child: Image.asset(
                                  planets[index].iconImage,
                                  height: 220,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 20,
                              bottom: 40,
                              child: Text(
                                planets[index].position.toString(),
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 200,
                                  color: primaryTextColor.withOpacity(0.08),
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          color: navigationColor,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/menu_icon.png'),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/search_icon.png'),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/profile_icon.png'),
            ),
          ],
        ),
      ),
    );
  }
}
