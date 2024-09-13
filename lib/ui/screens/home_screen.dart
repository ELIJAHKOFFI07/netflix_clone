import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/repositories/data_repository.dart';
import 'package:netflix_clone/services/Api_service.dart';
import 'package:netflix_clone/ui/widgets/movie_card.dart';
import 'package:netflix_clone/ui/widgets/movie_categorie.dart';
import 'package:netflix_clone/utils/constantes.dart';
import 'package:netflix_clone/utils/custom_text.dart';
import 'package:provider/provider.dart';

import '../../models/movie.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    final dataProvider=Provider.of<DataRepository>(context);
    final  movies=dataProvider.popularMovieList;
    final currentMovies=dataProvider.nowPlayingList;


    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: Image.asset(logo2),
      ),
      body: ListView(
        children: [
          Container(
            height: 500,
            color: Colors.red,
            child: MovieCard(movie: movies[10]),
          ),
MovieCategorie(label: "Tendances actuelles",
    movieList: movies,
    height: 160,
    width: 120,
  listEnd: dataProvider.getPopularMovies,
),
          MovieCategorie(label: "Les mieux notés selon le public  ",
              movieList: currentMovies,
              height: 320,
              width: 220,
            listEnd: dataProvider.getNowPlaying,
          ),
          MovieCategorie(label: "Ils arrivent bientot",
              movieList: dataProvider.upComingList,
              height: 160,
              width: 120,
            listEnd: dataProvider.getUpComingMovie,
          ),
          MovieCategorie(label: "Animations ",
            movieList: dataProvider.animationList,
            height: 320,
            width: 220,
            listEnd: dataProvider.getAnimationMovie,
          ),
          MovieCategorie(label: "Comédies",
            movieList: dataProvider.comedieList,
            height: 310,
            width: 210,
            listEnd: dataProvider.getAnimationMovie,
          ),
          MovieCategorie(label: "Drame",
            movieList: dataProvider.drameList,
            height: 310,
            width: 210,
            listEnd: dataProvider.getDrameMovie,
          ),
          MovieCategorie(label: "Documentaires",
            movieList: dataProvider.documentaireList,
            height: 310,
            width: 210,
            listEnd: dataProvider.getDocumetaireMovie,
          ),




        ],
      ),
    );
  }
}
