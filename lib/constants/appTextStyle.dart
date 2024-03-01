import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class TextAppStyle{
  static TextStyle noteTitle (){
    return GoogleFonts.poppins(fontSize: 28,color: Colors.black,fontWeight: FontWeight.w600);
  }
  static TextStyle noteSubTitle (){
    return GoogleFonts.poppins(fontSize: 20, color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.w400);
  }
  static TextStyle notedate (){
    return GoogleFonts.poppins(fontSize: 16, color: Colors.black.withOpacity(0.55), fontWeight: FontWeight.w500);
  }
  static TextStyle btnStyle (){
    return GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.black.withOpacity(.7));
  }

}