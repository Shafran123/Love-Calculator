import 'package:flutter/material.dart';
import 'package:love_calculator/loverDetailsScreen.dart';
import 'package:love_calculator/startScreen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
//import 'package:love_calculator/youDetailsScreen.dart';

class ResultScreen extends StatefulWidget {
  static const String routeName = "/result";

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

// void calculateLove (){
//   String combinedSting;
// }

class _ResultScreenState extends State<ResultScreen> {
  var lovePercentage;

  @override
  void initState() {
    super.initState();
  }

  calculateLove(yourName, loverName) async {
    String combinedText = yourName + 'loves';
    String combinedTextReserse = loverName;

    List test = [];
    List test2 = [];
    int n = 0;
    int sum1 = 0;
    int sum2 = 0;
    double per = 0;
    //int matchCount;
    // String strAllChars = "";
    // String strCount = "";
    //  print(combinedText);

    combinedText.runes.forEach((int rune) {
      var character = new String.fromCharCode(rune);
      test.add(character);
      print(character);
    });

    combinedTextReserse.runes.forEach((int rune) {
      var character = new String.fromCharCode(rune);
      test2.add(character);
      print(character);
    });

    // test.forEach((element) {
    //   print(element);
    // });

    for (int i = 0; i < test.length; i++) {
      n = (i);
      sum1 = sum1 + n;
    }

    for (int i = 0; i < test2.length; i++) {
      n = (i);
      sum2 = sum2 + n;
    }

    if (sum1 <= sum2)
      per = (sum1 / sum2) * 100;
    else
      per = (sum2 / sum1) * 100;

    // print(test);
    // print(test2);
    print(per);
    lovePercentage = per;

    //return lovePercentage;
  }

  @override
  Widget build(BuildContext context) {
    final FinalArgs finalArgs = ModalRoute.of(context).settings.arguments;

    calculateLove(finalArgs.yourName, finalArgs.loverName);

    print(lovePercentage);

    return Scaffold(
      backgroundColor: Colors.pink,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/bg.png',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 70.0),
                    child: Image.asset(
                      'assets/images/Logo.png',
                    ),
                  ),
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      finalArgs.yourName +
                          ' & ' +
                          finalArgs.loverName +
                          ' Loves ',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )),
                ],
              ),
              CircularPercentIndicator(
                radius: 250.0,
                lineWidth: 20.0,
                animation: true,
                percent: lovePercentage / 100,
                center: new Text(
                  '${lovePercentage.toStringAsFixed(2)} %',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.white),
                ),
                // footer: new Text(
                //   "Sales this week",
                //   style:
                //       new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                // ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.white,
                backgroundColor: Colors.pink,
              ),
              GestureDetector(
                onTap: () {
                     Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StartScreen(),
                  ));
                },
                              child: Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Center(
                            child: Text('Finish 🙈💘',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink)))
                      ],
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
