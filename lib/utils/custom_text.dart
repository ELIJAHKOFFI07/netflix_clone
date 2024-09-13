import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends Text{
  final String  mot;
  CustomText(this.mot):super(mot,
      style:
  GoogleFonts.poppins(
  color:Colors.white,
  fontSize:18,
  fontWeight:FontWeight.bold
  ));

}