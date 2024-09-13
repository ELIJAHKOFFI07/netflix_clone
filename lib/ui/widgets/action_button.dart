import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/utils/constantes.dart';
class ActionButton extends StatelessWidget {
  final String label ;
  final IconData icon;
  final Color bg;
  final Color fg;
  const ActionButton({super.key, required this.label, required this.icon, required this.bg, required this.fg});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: bg
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.play_arrow,color: fg,),
          const SizedBox(width: 5,),
          Text(label,
            style: GoogleFonts.poppins(
                color:fg,
                fontSize:16,
                fontWeight:FontWeight.w600
            ),)
        ],
      ),

    );
  }
}
