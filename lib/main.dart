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

  numberPressed(int number) {
    print(number);
  }

  operatorPressed(String operator) {
    print(operator);
  }

  result() {
    print('result');
  }

  clear() {
    print('Clear');
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
                const TextField(
                  enabled: false,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: otherButtonsColor,
                    ),),
                    // labelText: 'Result'
                  ),
                ),
                const SizedBox(height: 5,),
                const TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: otherButtonsColor,
                      )
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                  CalcButton(child: ButtonText(text: 'C', color: Colors.white,), onTap: clear, backgroundColor: otherButtonsColor,),
                  CalcButton(child: ButtonText(text: '<<', color: Colors.white,), onTap: () => operatorPressed('<<'), backgroundColor: otherButtonsColor,),
                  CalcButton(child: ButtonText(text: '%', color: Colors.white,), onTap: () => operatorPressed('%'), backgroundColor: otherButtonsColor,),
                  CalcButton(child: ButtonText(text: '/', color: Colors.white,), onTap: () => operatorPressed('/'), backgroundColor: otherButtonsColor,),
                ],),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                  CalcButton(child: ButtonText(text: '7'), onTap: () => numberPressed(7)),
                  CalcButton(child: ButtonText(text: '8'), onTap: () => numberPressed(8)),
                  CalcButton(child: ButtonText(text: '9'), onTap: () => numberPressed(9)),
                  CalcButton(child: ButtonText(text: 'X', color: Colors.white,), onTap: () => operatorPressed('*'), backgroundColor: otherButtonsColor,),
                  ],),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                  CalcButton(child: ButtonText(text: '4'), onTap: () => numberPressed(4)),
                  CalcButton(child: ButtonText(text: '5'), onTap: () => numberPressed(5)),
                  CalcButton(child: ButtonText(text: '6'), onTap: () => numberPressed(6)),
                  CalcButton(child: ButtonText(text: '-', color: Colors.white,), onTap: () => operatorPressed('-'), backgroundColor: otherButtonsColor,),
                  ],),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                  CalcButton(child: ButtonText(text: '1'), onTap: () => numberPressed(1)),
                  CalcButton(child: ButtonText(text: '2'), onTap: () => numberPressed(2)),
                  CalcButton(child: ButtonText(text: '3'), onTap: () => numberPressed(3)),
                  CalcButton(child: ButtonText(text: '+', color: Colors.white,), onTap: () => operatorPressed('+'), backgroundColor: otherButtonsColor,),
                  ],),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CalcButton(child: ButtonText(text: '0'), onTap: () => numberPressed(0)),
                    CalcButton(child: ButtonText(text: '.'), onTap: () => operatorPressed('.')),
                    SizedBox(height: 80,child:
                      CalcButton(child: ButtonText(text: '=', color: Colors.white,),
                        onTap: result, backgroundColor: otherButtonsColor, size: 173,),),
                  ],)
              ],),
            ),
          ),
        ),
      ),
    );
  }
}



