import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masonry_grid/masonry_grid.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _controller = PageController(viewportFraction: 1.0);
  double _page = 0.0;

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        _page = _controller.page!;
      });
    });

    super.initState();
  }

  List<String> images = [
    "assets/images/animals/fox.jpg",
    "assets/images/animals/cat.jpg",
    "assets/images/animals/dog.jpg",
    "assets/images/animals/hamster.jpg",
    "assets/images/animals/lion.jpg",
    "assets/images/animals/parrot.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(width * 0.05),
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopBar(height, width),
              Container(
                width: width * 0.9,
                height: height * 0.3,
                margin: EdgeInsets.only(top : height*0.05),
                color: Colors.transparent,
                child: PageView.builder(
                  itemCount: images.length,
                  controller: _controller,
                  itemBuilder: (context, index) {
                    double result = (_page - index);
                    double scale = (-(result * result) + 1);
                    // print(result);
                    return Container(
                      width: width * 0.8,
                      height: height * 0.3,
                      child: Stack(
                        children: [
                          Positioned(
                            top: height * 0.14,
                            left: width * 0.05,
                            child: Opacity(
                              opacity: scale.clamp(0, 1),
                              child: Transform.translate(
                                offset: Offset((-200*result),
                                    (-100 * (result * result))),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    width: width * 0.8,
                                    height: height * 0.15,
                                    color: Color(0xff2f3432).withOpacity(0.6),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: height * 0.02,
                            left: width * 0.015,
                            child: Transform.scale(
                              scale: scale,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  images[index],
                                  width: width * 0.87,
                                  height: height * 0.25,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              top: height*0.04,
                              left: width*0.04,
                              width: width * 0.43,
                              height: 35,
                              child: Opacity(
                                opacity: scale.clamp(0, 1),
                                child: Transform.translate(
                                  offset: Offset((150*(result*result)), (100*(result*(result)))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/avatar.png',
                                        width: 32,
                                        height: 32,
                                        fit: BoxFit.cover,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Capture with Nikon",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.white
                                                          .withOpacity(0.6),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 10,
                                                      letterSpacing: 1.5,
                                                      height: 1.2))),
                                          Text('John Legend',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12,
                                                      letterSpacing: 1.5,
                                                      height: 1.2)))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top : height*0.025,bottom: height*0.025),
                child: Row(
                  children: [
                    Text("Today"+"\'s capture", style:GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 25,
                                                            letterSpacing: 1.5,
                                                            height: 1.2)) ,),
                  ],
                ),
              ),
              MasonryGridViewForTheImages(width),
              SizedBox(
                height: height * 0.1,
              )
            ],
          ),
        ),
      ),
    );
  }

  MasonryGridView MasonryGridViewForTheImages(double width) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      itemCount: images.length,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Container(
          child: Center(
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(images[index], fit: BoxFit.cover)),
                Positioned(
                  left: width * 0.32,
                  top: 10,
                  child: GestureDetector(
                    onTap: () {
                      print("Image Path :" + images[index]);
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.transparent,
                          border: Border.all(
                              width: 2, color: Colors.white.withOpacity(0.4))),
                      child: Center(
                          child: Icon(
                        CupertinoIcons.exclamationmark,
                        size: 20,
                        color: Colors.white.withOpacity(0.4),
                      )),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Container TopBar(double height, double width) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width * 0.5,
            child: RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "Let" + "\'s share your ",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          letterSpacing: 1.5,
                          height: 1.2))),
              TextSpan(
                  text: 'moment',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Color(0xffeab67b),
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          letterSpacing: 1.5,
                          height: 1.2)))
            ])),
          ),
          Container(
            width: width * 0.11,
            height: width * 0.11,
            color: Colors.transparent,
            child: Stack(
              children: [
                Center(
                    child: Icon(
                  CupertinoIcons.bell_fill,
                  color: Colors.white,
                  size: 40,
                )),
                Positioned(
                    left: (width * 0.11) / 2,
                    top: 1,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffeab67b),
                          border: Border.all(width: 3)),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
