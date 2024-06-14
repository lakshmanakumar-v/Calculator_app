import 'dart:math';

import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final firstNumber = TextEditingController();
  final secondNumber = TextEditingController();
  int output = 0;

  // final dummy = TextEditingController();

  // final variable value cannot be changed but dynamic variable value can be changed
  // final number=[];
  //dynamic name='laksh';
  // @override
  // void initState() {
  //   number=[];
  //   name=10;
  //   super.initState();
  // }

  bool isAllowed() {
    bool returnValue = true;
    if (firstNumber.text.isEmpty) {
      returnValue = false;
      print("First number is not entered");
    } else if (secondNumber.text.isEmpty) {
      returnValue = false;
      print("Second number is not entered");
    }
    return returnValue;
  }

  bool check() {
    bool result = true;
    if (int.parse(firstNumber.text) == 0) {
      result = false;
      log("Enter first number greater than zero" as num);
    } else if (int.parse(secondNumber.text) == 0) {
      result = false;
      print("Enter second number greater than zero");
    }
    return result;
  }

  void addition() {
    if (isAllowed()) {
      setState(() {
        output = int.parse(firstNumber.text) + int.parse(secondNumber.text);
      });
      print("Output in addition: $output");
    }
  }

  void subtraction() {
    if (isAllowed()) {
      if (int.parse(firstNumber.text) > int.parse(secondNumber.text)) {
        setState(() {
          output = int.parse(firstNumber.text) - int.parse(secondNumber.text);
        });
        print("Output in subtraction: $output");
      } else {
        print("Enter first number as Greater for subtraction");
      }
    }
  }

  void multiplication() {
    if (isAllowed()) {
      if (check()) {
        setState(() {
          output = int.parse(firstNumber.text) * int.parse(secondNumber.text);
        });
        print("Output in multiplication: $output");
      }
    }
  }

  void division() {
    if (isAllowed()) {
      if (check()) {
        if (int.parse(firstNumber.text) > int.parse(secondNumber.text)) {
          setState(() {
            output =
                int.parse(firstNumber.text) ~/ int.parse(secondNumber.text);
          });
          print('Output in division: $output');
        } else {
          print("Enter first number as Greater for division");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator App',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // TextFormField(
          //   controller:dummy,
          // ),
      
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: firstNumber,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Enter first number',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: secondNumber,
                    decoration: const InputDecoration(
                      hintText: 'Enter second number',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          if (output >= 0) ...[
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Text(
                output.toString(),
              ),
            ),
          ],
          const SizedBox(
            height: 40,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      addition();
                      // firstNumber.clear();
                      // firstNumber.text = 'laksh';
                      // firstNumber.dispose();
                    },
                    child: const Text('Addition'),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {
                      subtraction();
                    },
                    child: const Text('Subtraction'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      multiplication();
                    },
                    child: const Text('Multiplication'),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {
                      division();
                    },
                    child: const Text('Division'),
                  ),
                ],
              ),
              // ElevatedButton(onPressed: (){
              //   // setState(() {
              //   //   print(dummy.text);
              //   // });
      
              // }, child: const Icon(Icons.account_balance_rounded),),
              // ElevatedButton(onPressed: (){
              //   setState(() {
              //     dummy.text='RAM';
              //   });
              // }, child: const Icon(Icons.account_balance_rounded),),
              // TextFormField(
              // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              // )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}