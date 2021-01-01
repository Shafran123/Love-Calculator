import 'package:flutter/material.dart';
import 'package:love_calculator/youDetailsScreen.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/bg.png',
            fit: BoxFit.cover,
          ),
          Center(child: Image.asset('assets/images/Logo.png')),
          Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: 
                                    (context) => YourDetailsScreen()
                                  ));
                },
                              child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                           color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    height: 70,
                    // color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Tap to Start 🙈 💘',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Colors.pink, fontSize: 18.0, fontWeight: FontWeight.bold),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
