import 'package:brownie_app/ui/order.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:brownie_app/animations/navigations.dart';

//buttonbol_navigation (text) {
//  // button get the graduate
//  bool isOk = false;
//
//  return GestureDetector(
//      child: Container(
//        //rmargin: const EdgeInsets.only(left: 130.0),
//        width: 150.0,
//        height: 55.0,
//        decoration: BoxDecoration(
//            color: Colors.brown,
//            borderRadius: BorderRadius.circular(15.0)
//
//        ),
//        child:Center(
//            child: Text(text, style: TextStyle(color: Colors.white,
//                                                fontSize: 16),)
//        ),
//
//      ), onTap: () {
//        Vibration.vibrate(duration: 70, amplitude: 50);
//
//
//      }
//  );
//}




Widget buttonbol_navigation (String title,rote,BuildContext context) { //name,password
  // button get the graduate
  bool isOk = false;

  return GestureDetector(
      child: Container(
        //rmargin: const EdgeInsets.only(left: 130.0),
        width: 150.0,
        height: 55.0,
        decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(15.0)

        ),
        child:Center(
            child: Text(title, style: TextStyle(color: Colors.white,
                fontSize: 16),)
        ),

      ), onTap: () {
    Vibration.vibrate(duration: 70, amplitude: 50);

    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => rote)
    );

  }
  );
}

textButton (title,rote,contex) {
  return GestureDetector(
    child: Text("Cadastrar", style: TextStyle(color: Colors.brown),),
    onTap: (){
      Navigator.of(contex).push(
          MaterialPageRoute(builder: (context) => rote)
      );
    },
  );
}



Widget buttonbol_general_button (String title,Function onTap) { //name,password
  // button get the graduate
  bool isOk = false;

  return GestureDetector(
      child: Container(
        //rmargin: const EdgeInsets.only(left: 130.0),
        width: 150.0,
        height: 55.0,
        decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(15.0)

        ),
        child:Center(
            child: Text(title, style: TextStyle(color: Colors.white,
                fontSize: 16),)
        ),

      ), onTap: onTap
      
      
       
  );
}

