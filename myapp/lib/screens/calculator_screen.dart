import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/components/bottom_button.dart';
import 'package:myapp/components/round_icon_button.dart';
import 'package:myapp/components/reusable_card.dart';
import 'package:myapp/components/icon_content.dart';
import 'package:myapp/utils/calculate_bmi.dart';
import 'package:myapp/screens/result_screen.dart';

import '../constants.dart';

enum Gender{
  male,
  female,
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  Gender selectedGender=Gender.male;
  int height=180;
  int weight=60;
  int age=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                //First Container starts here
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.male;
                      });

                    },
                    colour: selectedGender==Gender.male
                    ?kActiveCardColour
                    :KInActiveCardColour,
                    cardChild:IconContent(
                      icon: FontAwesomeIcons.male,
                      label: 'MALE',
                      ) ,
                    )
                  ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.female;
                      });

                    },
                    colour: selectedGender==Gender.female
                    ?kActiveCardColour
                    :KInActiveCardColour,
                    cardChild:IconContent(
                      icon: FontAwesomeIcons.female,
                      label: 'FEMALE',
                      ) ,
                    )
                  ),
                  //First Container ends here

              ],
              ),
              
              ),
              //Second Container starts here
              Expanded(
                child: ReusableCard(
                  colour:kActiveCardColour ,
                  cardChild:Column(
                    children: [
                      Text(
                        'HEIGHT',
                        style: KlabelTextStyle,
                        ),  
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: KlabelTextStyle,
                            ),
                      ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                          max: 220.0,
                          min: 120.0,
                          value: height.toDouble(), 
                          onChanged: (double newValue){
                            setState(() {
                              height=newValue.round();
                            });
                          }
                          )
                        )
                    ],
                  ) ,
                  )
                  ),
                  //Second Container end here
                  //third Container starts here
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: ReusableCard(
                            colour: kActiveCardColour,
                            cardChild: Column(
                              children: [
                                Text(
                                  'HEIGHT',
                                  style: KlabelTextStyle,
                                  ),
                                  Text(
                                    height.toString(),
                                    style: kNumberTextStyle,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RoundIconButton(
                                        icon:FontAwesomeIcons.minus,
                                        onPressed: (){
                                          setState(() {
                                            height--;
                                          });
                                        },
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                      RoundIconButton(
                                        icon:FontAwesomeIcons.plus ,
                                        onPressed: (){
                                          setState(() {
                                            height++;  
                                          });
                                        },
                                        ),
                                    ],
                                    ),

                              ],
                            ),

                          )
                          ),
                        Expanded(
                          child: ReusableCard(
                            colour: kActiveCardColour,
                            cardChild: Column(
                              children: [
                                Text(
                                  'AGE',
                                  style: KlabelTextStyle,
                                  ),
                                  Text(
                                    age.toString(),
                                    style: kNumberTextStyle,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RoundIconButton(
                                        icon:FontAwesomeIcons.plus ,
                                        onPressed: (){
                                          setState(() {
                                            age--;
                                          });
                                        },
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                      RoundIconButton(
                                        icon:FontAwesomeIcons.minus ,
                                        onPressed: (){
                                          setState(() {
                                            age++;  
                                          });
                                        },
                                        ),
                                    ],
                                    ),

                              ],
                            ),

                          )
                          ),

                    ],
                    )
                    ),
                  //third Container ends here
                 BottomButton(
                   buttonTitle: 'CALCULATE',
                   onTap:(){
                     BmiLogic calc=BmiLogic(height: height, weight: weight);
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context)=>ResultPage(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getResult(),
                          interpretation: calc.getInterpretation(),
                        ),
                        ),
                      );
                   } 
                   ,)

        ],
      
      ),
      );
  }
}