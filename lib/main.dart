//Importing material dart from existing package (see pubsec.yaml)
import 'package:flutter/material.dart';

import './question.dart';

void main() {
  runApp(MyApp()); //Native function to project widget tree to device
}

//Creating a stateful widget to wrap stateless widget
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//Extending the native widget class (with abstraction)
class _MyAppState extends State<MyApp> {
  //Question Cursor
  var _questionIndex = 0;

  //Implement abstract function which return a Widget
  @override
  Widget build(BuildContext context) {
    //Building Questions Bank
    var questions = [
      "What's your favourite animal?",
      "What's your favourite color?"
    ];

    //Creating function for on pressed
    void _buttonClicked() {
      //need to "refresh" the state
      setState(() {
        _questionIndex = _questionIndex + 1; //increment question index
      });
      print(_questionIndex);
      //print('Answer 1 chosen!');
    }

    return MaterialApp(
      /*
        Scaffold is a Native Class to create a Scaffolding
        It has combination with AppBar for modifying the bar and Body
      */
      home: Scaffold(
        appBar: AppBar(
          title: Text("First Question App!"),
        ),
        body: Column(
          children: [
            Question(
              questions.elementAt(_questionIndex),
            ),
            RaisedButton(
              child: Text("Jawaban 1"),
              onPressed: _buttonClicked,
            ),
            RaisedButton(
              child: Text("Jawaban 2"),
              onPressed: () {
                //... Do something here (this is anonymous function)
                print("Answer 2 chosen!");
              },
            ),
            RaisedButton(
              child: Text("Jawaban 13"),
              onPressed: () => print('Answer 13 chosen!'),
            ),
          ],
        ),
      ),
    );
  }
}
