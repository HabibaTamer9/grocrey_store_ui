import 'package:flutter/material.dart';
import 'package:grocrey_store/home.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  startTimer() async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context)=>Home()),
            (route) => false,);
    });
  }


  @override
  initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Grocery Store",
              style: TextStyle(
                color: Colors.green.shade700,
                fontSize: 40,
                fontWeight: FontWeight.bold,

              ),
            ),
            Text(
              "make your shopping easy",
              style: TextStyle(
                color: Colors.green.shade700,
                fontSize: 20,

              ),
            )
          ],
        ),
      ),
    );
  }
}
