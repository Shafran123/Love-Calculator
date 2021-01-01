import 'package:flutter/material.dart';
import 'package:love_calculator/loverDetailsScreen.dart';

class ScreenArguments {
  final String name;
  final String age;
  ScreenArguments(this.name, this.age);
}

class YourDetailsScreen extends StatefulWidget {
  static const String routeName = "/yourDetails";

  @override
  _YourDetailsScreenState createState() => _YourDetailsScreenState();
}

class _YourDetailsScreenState extends State<YourDetailsScreen> {
  final _yourNameController = TextEditingController();
  final _yourAgeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
      Navigator.pushNamed(
        context,
        LoverDetailsScreen.routeName,
        arguments: ScreenArguments(
          _yourNameController.text,
          _yourAgeController.text,
        ),
      );
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        'Enter Your Details',
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
                          // key: _formKey,
                          controller: _yourNameController,
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                           setState(() {
                             _formKey.currentState.validate();
                           });
                          },
                          validator: (value) => value.isEmpty
                              ? 'Your Name Cannot Be Empty'
                              : null,
                          decoration: InputDecoration(
                              labelText: "Your Name",
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
                          controller: _yourAgeController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Your Age",
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
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => LoverDetailsScreen(),

              //       settings: RouteSettings(
              //         name : _yourNameController.text,

              //       ),
              //     ));
              this.validateAndSave();
              // Navigator.pushNamed(
              //   context,
              //   LoverDetailsScreen.routeName,
              //   arguments: ScreenArguments(
              //     _yourNameController.text,
              //     _yourAgeController.text,
              //   ),
              // );
            },
            child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                color: Colors.pink,
                child: Stack(
                  children: [
                    Center(
                        child: Text('Next 🙈💘',
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
