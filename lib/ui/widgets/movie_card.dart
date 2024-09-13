import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/ui/screens/movie_details.dart';

import '../../models/movie.dart';
class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        final route=MaterialPageRoute(builder: (context)=>MovieDetailsPage(movie: movie,));
        Navigator.push(context, route);
      },
      child: CachedNetworkImage(
          imageUrl: movie.posterURL(),
        fit: BoxFit.cover,
        errorWidget:(context,url,error)=>const Center(child: Icon(Icons.error_outlined),) ,
      
      ),
    );
  }
}
