import 'package:flutter/material.dart';

import 'buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<String> buttons =
      [
        'C', 'DEL', '%', '/',
        '7', '8', '9', '*',
        '4', '5', '6', '-',
        '1', '2', '3', '+',
        '0', '.', 'ANS', '=',
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[100],
        title: Text(widget.title),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: Container(),
        ),
        Expanded(
            flex: 2,
            child: Container(

                    // This will just build a grid of numbers (or other things).
                    child: GridView.builder(
                      itemCount: buttons.length,

                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                        itemBuilder: (BuildContext context, int index){

                          // Check to see if we are on the first button and format it.
                          if (index == 0){
                            return MyButton(
                            buttonText: buttons[index],
                            color: Colors.green,
                            textColor: Colors.white,
                            );
                          }

                          // Check to see if we are on the second button and format it
                          else if (index == 1){
                            return MyButton(
                            buttonText: buttons[index],
                            color: Colors.red,
                            textColor: Colors.white,
                            );
                          }

                          // Format the rest of the buttons.
                          else{
                            return MyButton(
                              buttonText: buttons[index],
                              color: isOperator(buttons[index]) ? Colors.deepPurple: Colors.deepPurple[50],
                              textColor: isOperator(buttons[index]) ? Colors.white: Colors.deepPurple,
                            );
                        }

                        }
                    )

                )),
      ]),
    );
  }

  // Check to see if the string is an operator to change the color.
  bool isOperator(String x){
    if (x == '%' || x == '/' || x == '*' || x == '-' || x == '+' || x == '='){
      return true;
    }
    return false;
  }

}
