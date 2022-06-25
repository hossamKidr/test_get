import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:korastelhasabat/shard/component/components.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcolatorScreeen extends StatefulWidget {
  const CalcolatorScreeen({Key? key}) : super(key: key);

  @override
  State<CalcolatorScreeen> createState() => _CalcolatorScreeenState();
}

class _CalcolatorScreeenState extends State<CalcolatorScreeen> {

  bool isOperator(String s){
    if(s=='%'|| s=='/'|| s=='x'|| s=='-'|| s=='='|| s=='+'){
      return true;
    }
    return false;
  }

  void equalPressed(){
    String finalQuestion = UserQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);

    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    UserAnswer = eval.toString();

  }

  var UserQuestion = '';
  var UserAnswer = '';

  final mytextStyle = TextStyle(fontSize: 30,color: Colors.deepPurple[900]);

  final List<String> Buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Column(
          children: [
            Expanded(
                child:
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: h * 0.05,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.centerLeft,
                          child: Text(UserQuestion,style: TextStyle(fontSize: 40),),

                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                          alignment: Alignment.centerRight,
                          child: Text(UserAnswer,style: TextStyle(fontSize: 40),)
                      ),
                    ],
                  ),
                )
            ),
            Expanded(
                flex: 2,
                child: Container(
                    child: GridView.builder(
                        itemCount: Buttons.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                        itemBuilder: (BuildContext context, int index) {
                          if(index==0){
                               return  MyButton(
                                 buttonTapped: (){
                                   setState(() {
                                     UserQuestion = '';
                                   });
                                 },
                                 buttonText: Buttons[index],
                                 color:Colors.green,
                                 textColor: Colors.white,
                               );
                          }else if(index==1){
                            return  MyButton(
                              buttonTapped: (){
                                setState(() {
                                  UserQuestion = UserQuestion.substring(0,UserQuestion.length-1);
                                });
                              },
                              buttonText: Buttons[index],
                              color:Colors.red,
                              textColor: Colors.white,
                            );
                          }else if(index==Buttons.length-1){
                            return  MyButton(
                              buttonTapped: (){
                                setState(() {
                                  equalPressed();
                                });
                              },
                              buttonText: Buttons[index],
                              color:Colors.black54,
                              textColor: Colors.lightBlue[200],
                            );
                          }
                          else{
                            return MyButton(
                              buttonTapped: (){
                                setState(() {
                                  UserQuestion = UserQuestion + Buttons[index];
                                });
                              },
                              buttonText: Buttons[index],
                              color:isOperator(Buttons[index]) ? Colors.black54 : Colors.lightBlue[200],
                              textColor: isOperator(Buttons[index]) ? Colors.lightBlue[200] : Colors.black54,
                            );
                          }
                        }
                        )
                )
            ),
          ],
        ),
      ),

    );

  }



}
