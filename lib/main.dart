import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "onboarding ui",
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3),(){
      Navigator.push(context,MaterialPageRoute(builder: (_) =>const  OnBoardScreen()));
      
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child:  Text(
      'Hire.in',
      textAlign: TextAlign.center,
      style: GoogleFonts.averiaLibre(
        
      fontSize: 40,
      fontWeight: FontWeight.w900,
      letterSpacing: 1,
      color: Colors.white
      ),
    ),
      ),

    );
  }
}
class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/bg_video4.mp4');
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                height: _controller.value.size.height,
                width: _controller.value.size.width,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          Positioned.fill(
          bottom: 30,     
      
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
           const CircularProgressIndicator(color: Colors.grey,strokeWidth: 6,),
          Column(
            children: [
              Text(
      'Hire from over lots of people through',
      textAlign: TextAlign.center,
      style: GoogleFonts.averiaLibre(
        
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: Colors.black
      ),
    ),
    const SizedBox(height: 7,),
    Text(
      'Hire.in',
      textAlign: TextAlign.center,
      style: GoogleFonts.averiaLibre(
        
      fontSize: 24,
      fontWeight: FontWeight.w900,
      color: Colors.black
      ),
    ),
            ],
          )
    ,
    
                  ],
                ),
                height: 200,
                width: MediaQuery.of(context).size.width - 50,
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(18)
           ),
            
                
              ),
            ),
          )
        ],
      ),
    );
  }
}
