import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/repositories/data_repository.dart';
import 'package:netflix_clone/ui/widgets/MyVideoPlayer.dart';
import 'package:netflix_clone/ui/widgets/action_button.dart';
import 'package:netflix_clone/ui/widgets/movie_info.dart';
import 'package:netflix_clone/utils/constantes.dart';
import 'package:provider/provider.dart';

import '../../models/movie.dart';
import '../../utils/custom_text.dart';
import '../widgets/casting_card.dart';
import '../widgets/galerie.dart';
class MovieDetailsPage extends StatefulWidget {
  final Movie movie;
  const MovieDetailsPage({super.key, required this.movie});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  Movie? newMovie;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovieData();
  }

  getMovieData()async{
    final dataProvider=Provider.of<DataRepository>(context,listen:false);
    Movie movie=await dataProvider.getMovieDetails(movie: widget.movie);
    setState(() {
      newMovie=movie;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(backgroundColor: kBackgroundColor,),
      body: newMovie==null
          ?Center(child: SpinKitFadingCircle(
        color: kPrimaryColor,
        size: 50,
      )
      ):
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          Container(
            height: 300,
            width: MediaQuery.sizeOf(context).width,
            // color: Colors.red,

            //affiche la video associé au film si elle existe
            child: newMovie!.videos!.isEmpty
                ? Center(
              child: Text(
                'Pas de Bandes annoonces',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize:35
                ),
              ),
            )
                : MyVideoPlayer(movieId: newMovie!.videos!.first),
          ),
          const SizedBox(height: 10,),
          CustomText(newMovie!.name),
          const SizedBox(height: 5,),
          Text("Genres ${newMovie!.reformatGenres()}",
            style: GoogleFonts.poppins(
              color:Colors.grey,
              fontSize:14,
              fontWeight:FontWeight.w500

          ),),
         MovieInfo(newMovie: newMovie!),
          const SizedBox(height: 5,),

          const SizedBox(height: 10,),
          ActionButton(label: "Lecture", icon: Icons.play_arrow, bg: Colors.white, fg: kBackgroundColor),
          const SizedBox(height: 15,),
          ActionButton(label: "Telecharger la vidéo", icon: Icons.download, bg: Colors.grey.withOpacity(0.3), fg: Colors.white),
          const SizedBox(height: 20,),
          Text(newMovie!.description,style: GoogleFonts.poppins(
            fontSize:15,color:Colors.white
          ),),
          const SizedBox(height: 20,),
          CustomText("Casting"),
          SizedBox(
            height: 358,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: newMovie!.casting!.length,
                itemBuilder: (context,index){
                return(newMovie!.casting![index].imageURL==null)?const Center():CastingCard(person: newMovie!.casting![index],);

                }
                )


            ,
          ),
          const SizedBox(height: 20,),
          CustomText("Galerie"),

          const SizedBox(height: 15,),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: newMovie!.images!.length,
                itemBuilder: (context,index)=>GalerieCard(posterPath: newMovie!.images![index])),
          )



        ],),
      ),
    );

  }
}
