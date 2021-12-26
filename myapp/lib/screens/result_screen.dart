import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/bottom_button.dart';
import 'package:myapp/components/reusable_card.dart';
import 'package:myapp/constants.dart';

class ResultPage extends StatelessWidget{
  ResultPage({
    required this.interpretation,
    required this.bmiResult,
    required this.resultText,
  });
    
    final String bmiResult;
    final String resultText;
    final String interpretation;

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR')
        ,),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child:Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                  ),
              )

              ),
              Expanded(
                flex: 5,
                child:ReusableCard(
                  colour: kActiveCardColour,
                  cardChild:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText.toUpperCase(),
                        style: KResultTextStyle,
                      ),
                      Text(
                        bmiResult,
                        style: KBMITextStyle,
                      ),
                      Text(
                        interpretation,
                        style: KBodyTextStyle,
                      )
                    ],
                  ) ,
                  )
                 ),
                 BottomButton(
                   buttonTitle:'RECALCULATE' ,
                   onTap: (){
                     Navigator.pop(context);
                   },
                   )
          ],

        )
        ,);
  }
}