import 'package:flutter/material.dart';
import 'package:love_calculator/resultScreen.dart';
import 'package:love_calculator/youDetailsScreen.dart';

class FinalArgs {
  final String yourName;
  final String yourAge;
  final String loverName;
  final String loverAge;
  FinalArgs(this.yourName, this.yourAge, this.loverName, this.loverAge);
}

class LoverDetailsScreen extends StatefulWidget {
  static const String routeName = "/loverDetails";

  final data1;
  // LoverDetailsScreen({this.data});
  LoverDetailsScreen({Key key, this.data1}) : super(key: key);

  @override
  _LoverDetailsScreenState createState() => _LoverDetailsScreenState();
}

class _LoverDetailsScreenState extends State<LoverDetailsScreen> {
  final _loverNameController = TextEditingController();
  final _loverAgeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateAndSave(yourName, yourAge) {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
      Navigator.pushNamed(
        context,
        ResultScreen.routeName,
        arguments: FinalArgs(yourName, yourAge, _loverNameController.text,
            _loverAgeController.text),
      );
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    final yourName = args.name;
    final yourAge = args.age;
    print(args.age + args.name);

    // print(widget.data1);
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.pink,
            height: MediaQuery.of(context).size.height / 3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/Logo.png',
                    // fit: BoxFit.cover,
                    scale: 2,
                  ),
                ),
                Image.asset(
                  'assets/images/bg.png',
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Enter Your Lover Details',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.max ,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        child: TextFormField(
                          controller: _loverNameController,
                          onChanged: (value) {
                            setState(() {
                              _formKey.currentState.validate();
                            });
                          },
                          validator: (value) => value.isEmpty
                              ? 'Your Lover Name Cannot Be Empty'
                              : null,
                          decoration: InputDecoration(
                              labelText: "Your Lover Name",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0)),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never),
                        )),
                    SizedBox(height: 20),
                    Container(
                        alignment: Alignment.topLeft,
                        child: TextFormField(
                          controller: _loverAgeController,
                          decoration: InputDecoration(
                              labelText: "Your Lover Age",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0)),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never),
                        )),
                  ],
                ),
              ),
            ),
          ),
          // Text(yourName),
          GestureDetector(
            onTap: () {
              validateAndSave(yourName, yourAge);
            },
            child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                color: Colors.pink,
                child: Stack(
                  children: [
                    Center(
                        child: Text('Calculate 🙈💘',
                            style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)))
                  ],
                )),
          )
        ],
      ),
    );
  }
}
