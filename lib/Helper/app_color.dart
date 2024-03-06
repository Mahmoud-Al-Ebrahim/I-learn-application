import 'package:flutter/material.dart';

class AppColors{

   static const MaterialColor primaryColor= MaterialColor(
   0xff2661B2,
   <int,Color>{
     25: Color(0xff2661B2),
     50: Color(0xff2661B2),
     100: Color(0xff295FA6),
     200: Color(0xff1753A7),
     300: Color(0xff083A7D),
     400: Color(0xff152944),// the color for validation
   }
       );
   static const MaterialColor accentColor=   MaterialColor(
       0xff323232,
       <int,Color>{
         25: Color(0xffffffff),
         50:Color(0xff5A5A5A),
         100: Color(0xff707070),
         150: Color(0xff363636),
         200: Color(0xff1C1C1C),
         300: Color(0xff161616),
       }
   );

       static const Color shadowColor=Color.fromARGB(51, 0, 0, 0);
       static const Color scaffoldBackGroundColor=Color(0xffFCFCFC);


}