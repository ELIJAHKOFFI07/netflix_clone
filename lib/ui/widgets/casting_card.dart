import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/models/person.dart';
import 'package:netflix_clone/utils/custom_text.dart';

import '../../services/api.dart';
class CastingCard extends StatelessWidget {
  final Person person;
  const CastingCard({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(imageUrl:API().baseImageURL+person.imageURL! ,
            width: 160,
            fit: BoxFit.cover,
              errorWidget:(context,str,obj)=> const Center(child: Icon(Icons.error)),
            
            ),
          ),
           Padding(padding: const EdgeInsets.only(
            top:10, left:10,
          ),
             child: SizedBox(
               width: 150,
               child: Text(person.name,
               style: GoogleFonts.poppins(
                 fontSize:16,
                 fontWeight:FontWeight.bold
               ),
               ),
             ),

          ),
          Padding(padding: const EdgeInsets.only(
             left:10,
          ),
            child: SizedBox(
              width: 150,
              child: Text(person.characterName,
              style: GoogleFonts.poppins(
                fontSize:14
              ),
              ),
            ),

          )
        ],
      ),
    );
  }
}
