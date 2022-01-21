import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_gallery_using_flutter/screens/homescreen.dart';

class PagesWithBottomNavigationBar extends StatefulWidget {
  PagesWithBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _PagesWithBottomNavigationBarState createState() => _PagesWithBottomNavigationBarState();
}








class _PagesWithBottomNavigationBarState extends State<PagesWithBottomNavigationBar> {




  int _selectedIndex = 0;
  static TextStyle optionStyle = GoogleFonts.poppins(
                                                            textStyle: TextStyle(
                                                                 color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              letterSpacing: 1.5,
                              height: 1.2));
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
       Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Text(
          'EmptyScreen1',
          style: optionStyle,
    ),
        ),
      ),
    ),
    Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Text(
          'EmptyScreen2',
          style: optionStyle,
    ),
        ),
      ),
    ),
       Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Text(
          'EmptyScreen3',
          style: optionStyle,
    ),
        ),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            Center(child: _widgetOptions.elementAt(_selectedIndex)),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width : width,
                height: height*0.11,
                color : Colors.transparent,
                child: ClipRect(
                  child: BackdropFilter(filter: ImageFilter.blur(
                            sigmaX:5,
                            sigmaY:5,
                          ),
                          child: Container(
                            color : Colors.black.withOpacity(0.8)
                          ),
                          ),
                ), 
              ),
            ),
            Positioned(
              top : height*0.9,
              left :0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                child: Container(
                  width: width/4 ,
                  height: (height*0.09),
                  color : Colors.transparent,
                  child: Icon(CupertinoIcons.square_grid_2x2_fill, size: 35, color: _selectedIndex == 0 ? Colors.white : Colors.white.withOpacity(0.6),),
                ),
              )
              ),

               Positioned(
              top : height*0.9,
              left :width/5,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                child: Container(
                   width: width/5 ,
                  height: (height*0.085),
                  color : Colors.transparent,
                  child: Icon(CupertinoIcons.search,size: 35, color: _selectedIndex == 1 ? Colors.white : Colors.white.withOpacity(0.6),),
                ),
              )
              ),

                Positioned(
              top : height*0.9,
              left :(width/5)*3,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
                child: Container(
   width: width/5 ,
                  height: (height*0.085),
                  color : Colors.transparent,
                  child: Icon(CupertinoIcons.bookmark_fill,size: 35, color: _selectedIndex == 2 ? Colors.white : Colors.white.withOpacity(0.6),),
                ),
              )
              ),
              
               Positioned(
              top : height*0.9,
              left :(width/5)*4,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
                child: Container(
   width: width/6 ,
                  height: (height*0.085),
                  color : Colors.transparent,
                  child: Icon(CupertinoIcons.person_fill, size: 35, color: _selectedIndex == 3 ? Colors.white : Colors.white.withOpacity(0.6),),
                ),
              )
              ),

               Positioned(
              top : height*0.89,
              left :(width/5)*2,
              child: GestureDetector(
                onTap: () {
                 print('Upload Image');
                },
                child: Transform.scale(
                  scale: 0.9,
                  child: Container(
                    width: width/5 ,
                    height: (height*0.1),
                    color : Colors.transparent,
                    child:  Stack(
                      children: [
                       
                           Positioned(
                             left: -(((width/6)-(width/5))/2),
                             top : -(((width/6)-(width/5))/2)-2,
                             child: Container(
                              width : width/6,
                              height: width/6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(width/6),
                                border: Border.all(
                                  width: 3,
                                  color: Color(0xffe7b77d)
                                ),
                              ),
                              ),
                           ),
                          Positioned(
                            left:-(((width/7.2)-(width/5))/2),
                            top:-(((width/7.2)-(width/5))/2)-2,
                            child: Container(
                                  width : width/7.2,
                              height: width/7.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(width/7.2),
                                color: Color(0xff1b4a5a)
                              ),
                              child: Icon(CupertinoIcons.add, size: 30, color: Colors.white,),
                            ),
                          )
                        
                      ],
                    ),
                  ),
                ),
              )
              ),
          ],
        ),
    );
  }
}