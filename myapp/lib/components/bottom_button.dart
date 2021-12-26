import 'package:flutter/material.dart';
import '../constants.dart';



class BottomButton extends StatelessWidget{

  BottomButton({required this.buttonTitle, required this.onTap});

  String buttonTitle;
  void Function() onTap;
  @override



  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child:Center(
          child:Text(
            buttonTitle,
            style: KLargeButtonTextStyle,
          ) ,
          ),
          width: double.infinity,
          height: KBottomContainerHeight,
          color: kLargeButtonContainerColor,
          margin: EdgeInsets.only(top: 100),
          padding: EdgeInsets.only(bottom: 20.0),
      ),
    );
  }
}