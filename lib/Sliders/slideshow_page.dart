import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_player_app/Sliders/widgets/slideshow.dart';

class SlideshowPage extends StatelessWidget {
   static const String routeName = '/Slideshow-page';
  const SlideshowPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffD2CEDE),
      body: Column(
        children: const [
          Expanded(child: MySlideshow()),
           
        ],
      ) 
    );
  }
}

class MySlideshow extends StatelessWidget {
  const MySlideshow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
    
     bulletPrimario: 18, 
     bulletSecundario: 12,
     colorPrimario: const Color(0xffFF5A7E),
      slides: <Widget> 
    [
      SvgPicture.asset('assets/slide-1.svg'),
      SvgPicture.asset('assets/slide-2.svg'),
      SvgPicture.asset('assets/slide-3.svg'),
      SvgPicture.asset('assets/slide-4.svg'),
      SvgPicture.asset('assets/slide-5.svg'),
    ]);
  }
}