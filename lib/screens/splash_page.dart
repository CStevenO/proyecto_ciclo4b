import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  SplashPage({Key? key, required this.goToPage, required this.duration}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => goToPage));
    });
    return Scaffold(
      body: Container(
          color: const Color(0xFF38b6ff),
          alignment: Alignment.center,
          child: Column(
            children: [
              //IconFont(
              // color: Colors.blue,
              //size: 100,
              //iconName: IconFontHelper.MAIN_LOGO),
              Image.asset(
                "mitienditalogo1.png",
                height: 300.0,
                width: 300.0,
                //linea nueva para centrar , probar
                alignment: Alignment.center,
              ),
            ],
          )),
    );
  }
}