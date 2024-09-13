import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/movie.dart';
class MovieInfo extends StatelessWidget {
  final Movie newMovie;
  const MovieInfo({super.key, required this.newMovie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5,),
        Row(
          children: [
            Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 2,horizontal: 5
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.withOpacity(0.3),
                ),
                child: Text(
                  newMovie!.releaseDate!.substring(0,4),
                  style:GoogleFonts.poppins(
                    color:Colors.white,
                    fontSize:12,
                    fontWeight:FontWeight.w500
                    ,
                  ),
                )
            ),
            const SizedBox(width: 5,),
            Text("Recommandé à ${(newMovie!.vote!*10).toInt()}",
                style: GoogleFonts.poppins(
                  color:Colors.green,
                  fontSize:14,
                  fontWeight:FontWeight.w500
                  ,
                ))
          ],
        )
      ],
    );
  }
}
