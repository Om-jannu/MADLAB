import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;

  const CustText(
      {super.key,
      required this.text,
      required this.size,
      required this.fontWeight,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      text,
      style: GoogleFonts.mogra(
        textStyle: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
      )
    ));
  }
}
