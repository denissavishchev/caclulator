import 'package:flutter/material.dart';
import 'package:caclulator/calc_button.dart';
import 'package:caclulator/button_text.dart';
import 'package:caclulator/colors.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);



  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {

  int firstNum = 0;
  int secondNum = 0;
  String result = '';
  String textToDisplay = '';
  String operation = '';
  String history = '';


  buttonPressed(String btnValue) {
    print(btnValue);

      if (btnValue == 'C'){
        firstNum = 0;
        secondNum = 0;
        result = '';
        history = '';
      }
      else if (btnValue == '+' ||
                btnValue == '-' ||
                btnValue == 'X' ||
                btnValue == '/') {
        firstNum = int.parse(textToDisplay);
        result = '';
        operation = btnValue;
      }
      else if (btnValue == '<') {
        result = textToDisplay.substring(0, textToDisplay.length - 1);
      }
      else if (btnValue == '=') {
        secondNum = int.parse(textToDisplay);
        if (operation == '+') {
          result = (firstNum + secondNum).toString();
          history = firstNum.toString() + operation.toString() + secondNum.toString();
        }
        if (operation == '-') {
          result = (firstNum - secondNum).toString();
          history = firstNum.toString() + operation.toString() + secondNum.toString();
        }
        if (operation == 'X') {
          result = (firstNum * secondNum).toString();
          history = firstNum.toString() + operation.toString() + secondNum.toString();
        }
        if (operation == '/') {
          result = (firstNum / secondNum).toString();
          history = firstNum.toString() + operation.toString() + secondNum.toString();
        }
      }else {
        result = int.parse(textToDisplay + btnValue).toString();
      }
      setState(() {
        textToDisplay = result;
      });
  }



  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Calculator',
      home: Container(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          )),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Container(
                height: 60,
                alignment: Alignment.bottomCenter,
                child: const Text(
                  'Calculator',
                  style: TextStyle(
                    fontFamily: 'Italianno',
                    fontSize: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              backgroundColor: Colors.white.withOpacity(.3),
              shadowColor: Colors.white,
            ),
            body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(children: <Widget>[
                const SizedBox(height: 40,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.centerRight,
                  width: double.infinity,
                  height: 50,
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: otherButtonsColor.withOpacity(0.7),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 0)),
                    ],
                  ),
                  child: Text(
                   '$textToDisplay',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 30,
                    color: Colors.white),
               ),
                ),
                const SizedBox(height: 15,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.centerRight,
                  width: double.infinity,
                  height: 40,
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: otherButtonsColor.withOpacity(0.6),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 0)),
                    ],
                  ),
                  child: Text(
                    '$history',
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 20,
                        color: Colors.white)
                  ),
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                  CalcButton(child: ButtonText(text: 'C', color: Colors.white,), onTap: () => buttonPressed('C'), backgroundColor: otherButtonsColor,),
                  CalcButton(child: ButtonText(text: '<', color: Colors.white,), onTap: () => buttonPressed('<'), backgroundColor: otherButtonsColor,),
                  CalcButton(child: ButtonText(text: '%', color: Colors.white,), onTap: () => buttonPressed('%'), backgroundColor: otherButtonsColor,),
                  CalcButton(child: ButtonText(text: '/', color: Colors.white,), onTap: () => buttonPressed('/'), backgroundColor: otherButtonsColor,),
                ],),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                  CalcButton(child: ButtonText(text: '7'), onTap: () => buttonPressed('7')),
                  CalcButton(child: ButtonText(text: '8'), onTap: () => buttonPressed('8')),
                  CalcButton(child: ButtonText(text: '9'), onTap: () => buttonPressed('9')),
                  CalcButton(child: ButtonText(text: 'X', color: Colors.white,), onTap: () => buttonPressed('X'), backgroundColor: otherButtonsColor,),
                  ],),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                  CalcButton(child: ButtonText(text: '4'), onTap: () => buttonPressed('4')),
                  CalcButton(child: ButtonText(text: '5'), onTap: () => buttonPressed('5')),
                  CalcButton(child: ButtonText(text: '6'), onTap: () => buttonPressed('6')),
                  CalcButton(child: ButtonText(text: '-', color: Colors.white,), onTap: () => buttonPressed('-'), backgroundColor: otherButtonsColor,),
                  ],),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                  CalcButton(child: ButtonText(text: '1'), onTap: () => buttonPressed('1')),
                  CalcButton(child: ButtonText(text: '2'), onTap: () => buttonPressed('2')),
                  CalcButton(child: ButtonText(text: '3'), onTap: () => buttonPressed('3')),
                  CalcButton(child: ButtonText(text: '+', color: Colors.white,), onTap: () => buttonPressed('+'), backgroundColor: otherButtonsColor,),
                  ],),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CalcButton(child: ButtonText(text: '0'), onTap: () => buttonPressed('0')),
                    CalcButton(child: ButtonText(text: '.'), onTap: () => buttonPressed('.')),
                    SizedBox(height: 80,child:
                      CalcButton(child: ButtonText(text: '=', color: Colors.white,),
                        onTap: () => buttonPressed('='), backgroundColor: otherButtonsColor, size: 173,),),
                  ],)
              ],),
            ),
          ),
        ),
      ),
    );
  }
}



