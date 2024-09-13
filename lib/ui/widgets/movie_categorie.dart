import 'package:flutter/material.dart';

import '../../models/movie.dart';
import '../../utils/custom_text.dart';
import 'movie_card.dart';
class MovieCategorie extends StatelessWidget {
  final String label;
  final List<Movie>movieList;
  final double height;
  final double width;
  final Function listEnd;
  const MovieCategorie({super.key, required this.label, required this.movieList, required this.height, required this.width, required this.listEnd});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15,),

        CustomText(label),

        const SizedBox(height: 5,),
        SizedBox(
          height: height,
          child: NotificationListener<ScrollNotification >(
            onNotification: (ScrollNotification notification){
              // position dans le scroll
              final currentPosition=notification.metrics.pixels;
              final maxPosition=notification.metrics.maxScrollExtent;
              // on appelle la fonction a la fin du scroll pour changer la page selon la categorie
              if(currentPosition==maxPosition/2){
                listEnd();
              }
              return true;

            },
            child: ListView.builder(
              itemCount: movieList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context,int index){
            
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: width,
            
                  // color: Colors.yellow,
                  child: Center(
                    child: movieList.isEmpty
                        ?Text(index.toString())
                        :MovieCard(movie: movieList[index])
                    ,
                  ),
            
                );
              },
            ),
          ),
        ),

      ],
    );
  }
}
