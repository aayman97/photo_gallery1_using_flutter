import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_gallery_using_flutter/Components/backgroudImage.dart';
import 'package:photo_gallery_using_flutter/screens/pages.dart';

class StartPage extends StatefulWidget {
  StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with TickerProviderStateMixin {

    late AnimationController _controller;
  late Animation<double> _opacityAnimation;
   late Animation<double> _logoOpacityAnimation;
   late Animation<double> _logoTranslationAnimation;
      late Animation<double> _exploreTextOpacityAnimation;
      late Animation<double> _exploreTextTranslationAnimation;
       late Animation<double> _shareTextOpacityAnimation;
      late Animation<double> _shareTextTranslationAnimation;
       late Animation<double> _getStartedButtonAnimation;


bool _enable = false;

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
_controller = AnimationController(
  duration: Duration(seconds:5),
  vsync: this,

  );
    
_opacityAnimation= TweenSequence<double>(
      [
        TweenSequenceItem(
          weight: 10.0,
          tween: Tween(
            begin: 0.0,
            end:1.0,
          ),
        ),
        TweenSequenceItem(
          weight: 90.0,
          tween: Tween(
            begin: 1.0,
            end:1.0,
          )
          ,
        ),
      ],
    ).animate(new CurvedAnimation(parent: _controller, curve: Curves.linear));

    _opacityAnimation= TweenSequence<double>(
      [
        TweenSequenceItem(
          weight: 20.0,
          tween: Tween(
            begin: 0.0,
            end:1.0,
          ),
        ),
        TweenSequenceItem(
          weight: 90.0,
          tween: Tween(
            begin: 1.0,
            end:1.0,
          )
          ,
        ),
      ],
    ).animate(new CurvedAnimation(parent: _controller, curve: Curves.linear));

     _logoOpacityAnimation= TweenSequence<double>(
      [
        TweenSequenceItem(
          weight: 20.0,
          tween: Tween(
            begin: 0.0,
            end:0.0,
          ),
        ),
        TweenSequenceItem(
          weight: 20.0,
          tween: Tween(
            begin: 0.0,
            end:1.0,
          )
          ,
        ),
        TweenSequenceItem(
          weight: 60.0,
          tween: Tween(
            begin: 1.0,
            end:1.0,
          )
          ,
        ),
      ],
    ).animate(new CurvedAnimation(parent: _controller, curve: Curves.easeIn));

       _logoTranslationAnimation= TweenSequence<double>(
      [
        TweenSequenceItem(
          weight: 20.0,
          tween: Tween(
            begin: -5,
            end:-5,
          ),
        ),
        TweenSequenceItem(
          weight: 20.0,
          tween: Tween(
            begin: -5,
            end:0,
          )
          ,
        ),
        TweenSequenceItem(
          weight: 60.0,
          tween: Tween(
            begin: 0,
            end:0,
          )
          ,
        ),
      ],
    ).animate(new CurvedAnimation(parent: _controller, curve: Curves.easeIn));



      _exploreTextOpacityAnimation= TweenSequence<double>(
      [
        TweenSequenceItem(
          weight: 20.0,
          tween: Tween(
            begin: 0.0,
            end:0.0,
          ),
        ),
         TweenSequenceItem(
          weight: 20.0,
          tween: Tween(
            begin: 0.0,
            end:0.0,
          ),
        ),
        TweenSequenceItem(
          weight: 20.0,
          tween: Tween(
            begin: 0.0,
            end:1.0,
          )
          ,
        ),
        TweenSequenceItem(
          weight: 40.0,
          tween: Tween(
            begin: 1.0,
            end:1.0,
          )
          ,
        ),
      ],
    ).animate(new CurvedAnimation(parent: _controller, curve: Curves.easeIn));


     _exploreTextTranslationAnimation= TweenSequence<double>(
      [
        TweenSequenceItem(
          weight: 20.0,
          tween: Tween(
            begin: 5,
            end:5,
          ),
        ),
         TweenSequenceItem(
          weight: 20.0,
          tween: Tween(
            begin: 5,
            end:5,
          ),
        ),
        TweenSequenceItem(
          weight: 20.0,
          tween: Tween(
            begin: 5,
            end:0,
          )
          ,
        ),
        TweenSequenceItem(
          weight: 40.0,
          tween: Tween(
            begin: 0,
            end:0,
          )
          ,
        ),
      ],
    ).animate(new CurvedAnimation(parent: _controller, curve: Curves.easeIn));


    
      _shareTextOpacityAnimation= TweenSequence<double>(
      [
        TweenSequenceItem(
          weight: 20.0,
          tween: Tween(
            begin: 0.0,
            end:0.0,
          ),
        ),
         TweenSequenceItem(
          weight: 30.0,
          tween: Tween(
            begin: 0.0,
            end:0.0,
          ),
        ),
       
        TweenSequenceItem(
          weight: 20.0,
          tween: Tween(
            begin: 0.0,
            end:1.0,
          )
          ,
        ),
        TweenSequenceItem(
          weight: 30.0,
          tween: Tween(
            begin: 1.0,
            end:1.0,
          )
          ,
        ),
      ],
    ).animate(new CurvedAnimation(parent: _controller, curve: Curves.easeIn));


          _shareTextTranslationAnimation= TweenSequence<double>(
      [
        TweenSequenceItem(
          weight: 20.0,
          tween: Tween(
            begin: 5,
            end:5,
          ),
        ),
         TweenSequenceItem(
          weight: 30.0,
          tween: Tween(
            begin: 5,
            end:5,
          ),
        ),
       
        TweenSequenceItem(
          weight: 20.0,
          tween: Tween(
            begin: 5,
            end:0
          )
          ,
        ),
        TweenSequenceItem(
          weight: 30.0,
          tween: Tween(
            begin: 0,
            end:0,
          )
          ,
        ),
      ],
    ).animate(new CurvedAnimation(parent: _controller, curve: Curves.easeIn));


          _getStartedButtonAnimation= TweenSequence<double>(
      [
        TweenSequenceItem(
          weight: 20.0,
          tween: Tween(
            begin: 0.0,
            end:0.0,
          ),
        ),
         TweenSequenceItem(
          weight: 20.0,
          tween: Tween(
            begin: 0.0,
            end:0.0,
          ),
        ),
       
        TweenSequenceItem(
          weight: 20.0,
          tween: Tween(
            begin: 0.0,
            end:0.0,
          )
          ,
        ),
        TweenSequenceItem(
          weight: 30.0,
          tween: Tween(
            begin: 0.0,
            end:1.0,
          )
          ,
        ),
      ],
    ).animate(new CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }



  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    _controller.addStatusListener((status) {
  if(status == AnimationStatus.completed) {
   setState(() {
     _enable = true;
   });
  }
});  

return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              children: [
                Opacity(
                  opacity: _opacityAnimation.value,
                  child: Positioned(
                    top: 0,
                    child: BackgroundImage()
                    ),
                ),

                Positioned(
                  top : 0,
                  left : width*0.05,
                  child: Container(
                    child: Transform.translate(
                      offset: Offset(_logoTranslationAnimation.value,0),
                      child: Opacity(
                        opacity: _logoOpacityAnimation.value,
                        child: Image.asset('assets/images/logo.png',width: width*0.3,height: height*0.2,fit: BoxFit.contain,)),
                    ),
                  )
                  ),

                  Positioned(
                    top : height*0.55,
                    left : width*0.05,
                    child: Opacity(
                      opacity: _exploreTextOpacityAnimation.value,
                      child: Transform.translate(
                        offset: Offset(0,_exploreTextTranslationAnimation.value),
                        child: Container(
                          width : width*0.9,
                          child: RichText(
                            
                            text: TextSpan(
                               children: [
                                 TextSpan(text: "E", style:  TextStyle(
                                fontFamily: 'EastmanBold',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 45,
                              letterSpacing: 1.5,
                              height: 1.2
                            ),
                          ),
                                          
                          TextSpan( text: "xplore your Capture.",  style: GoogleFonts.poppins(
                                                            textStyle: TextStyle(
                                                                 color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 45,
                              letterSpacing: 1.5,
                              height: 1.2)
                                                                ))
                                          
                               ]
                            ),
                            
                          ),
                        ),
                      ),
                    )
                    ),


                     Positioned(
                    top : height*0.7,
                    left : width*0.07,
                    child: Opacity(
                      opacity: _shareTextOpacityAnimation.value,
                      child: Transform.translate(
                        offset: Offset(0,_shareTextTranslationAnimation.value),
                        child: Container(
                          width : width*0.8,
                          child: Text('Share your capture with Poto Gallery.', style: GoogleFonts.poppins(
                                                            textStyle: TextStyle(
                                                                 color: Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              letterSpacing: 2,
                              height: 1.5
                              )
                              )
                          ),
                        ),
                      ),
                    )
                    ),

                Positioned(
                  top :  height*0.82,
                  left: width*0.2,
                  child: Opacity(
                    opacity: _getStartedButtonAnimation.value,
                    child: GestureDetector(
                      onTap: () {
                        
                            if(_enable){
                              Navigator.pushReplacement(context, PageRouteBuilder( 
                        pageBuilder: (context, animation, secondaryAnimation) => PagesWithBottomNavigationBar(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              const begin = Offset(1, 0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOut;

                              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                                
                              );
                            },
                        )
                              );
                              }
                      },
                      child: Container(
                        width : width*0.6,
                        height: height*0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width*0.3),
                          border: Border.all(
                            color: Color(0xffeab67b)
                          )
                        ),
                        child: Center(
                          child: Text("Get Started", style: GoogleFonts.poppins(
                                                            textStyle: TextStyle(
                                                            color: Colors.white.withOpacity(1.0),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              letterSpacing: 2,
                          )
                          )
                          ),
                        ),
                      ),
                    ),
                  )
                  )
              ],
            );
          },
          );
      
}
}