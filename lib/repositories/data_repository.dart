import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/services/Api_service.dart';

import '../models/movie.dart';

class DataRepository with ChangeNotifier{
  final APIService apiService=APIService();
  // declarations de toutes les listes de categories de films
  final List<Movie>popularMovieList=[];
  final List<Movie>nowPlayingList=[];
  final List<Movie>upComingList=[];
  final List<Movie>animationList=[];
  final List<Movie>comedieList=[];
  final List<Movie>drameList=[];
  final List<Movie>documentaireList=[];
  // declarations de toys les index des listes de  categories de films
  int upComingPageIndex=1;
  int animationPageIndex=1;
  int popularMoviePageIndex=1;
  int nowPlayingPageIndex=1;
  int comediePageIndex=1;
  int dramePageIndex=1;
  int documentairePageIndex=1;


// toutes les fonctions pour  remplir les differentes listes
  Future<void> getPopularMovies()async{
    try{
List<Movie> movies=await apiService.getPopularMovies(pageNumber: popularMoviePageIndex);
popularMovieList.addAll(movies);
popularMoviePageIndex++;
notifyListeners();
    }
    on Response catch(response){
      print("ERROR ${response.statusCode}");
      rethrow;

    }
  }

  Future<void> getNowPlaying()async{
    try{
      List<Movie> movies=await apiService.getNowPlaying(pageNumber: nowPlayingPageIndex);
      nowPlayingList.addAll(movies);
      nowPlayingPageIndex++;
      notifyListeners();
    }
    on Response catch(response){
      print("ERROR ${response.statusCode}");
      rethrow;

    }
  }
  Future<void> getUpComingMovie()async{
    try{
      List<Movie> movies=await apiService.getUpComingMovies(pageNumber: upComingPageIndex);
      upComingList.addAll(movies);
      upComingPageIndex++;
      notifyListeners();
    }
    on Response catch(response){
      print("ERROR ${response.statusCode}");
      rethrow;

    }
  }
  Future<void> getAnimationMovie()async{
    try{
      List<Movie> movies=await apiService.getAnimationMovie(pageNumber: animationPageIndex);
      animationList.addAll(movies);
      animationPageIndex++;
      notifyListeners();
    }
    on Response catch(response){
      print("ERROR ${response.statusCode}");
      rethrow;

    }
  }
  Future<void> getComedieMovie()async{
    try{
      List<Movie> movies=await apiService.getComedieMovie(pageNumber: comediePageIndex);
      comedieList.addAll(movies);
      comediePageIndex++;
      notifyListeners();
    }
    on Response catch(response){
      print("ERROR ${response.statusCode}");
      rethrow;

    }
  }
  Future<void> getDrameMovie()async{
    try{
      List<Movie> movies=await apiService.getDrameMovie(pageNumber: dramePageIndex);
      drameList.addAll(movies);
      dramePageIndex++;
      notifyListeners();
    }
    on Response catch(response){
      print("ERROR ${response.statusCode}");
      rethrow;

    }
  }
  Future<void> getDocumetaireMovie()async{
    try{
      List<Movie> movies=await apiService.getDocumentaireMovie(pageNumber: documentairePageIndex);
      documentaireList.addAll(movies);
      documentairePageIndex++;
      notifyListeners();
    }
    on Response catch(response){
      print("ERROR ${response.statusCode}");
      rethrow;

    }
  }

  Future<Movie> getMovieDetails({required Movie movie}) async{

    try{
//       // infos du film
//       Movie newMovie=await apiService.getMovieDetails(movie: movie);
//       // on recupere la video
//       newMovie=await apiService.getMovieVideos(movie: newMovie);
//       // on recupere le casting
//       newMovie=await apiService.getMovieCard(movie: newMovie);
// // on recupere les images
//       newMovie=await apiService.getMovieImage(movie: newMovie);
      
      Movie newMovie= await apiService.getMovieInfo(movie: movie);
      return newMovie;



    }
    on Response catch(respnse){
      print("ERROR ${respnse.statusCode}");
      rethrow;
    }
  }



  // charges toutes les listes de videos
  Future<void>initData()async{
    // les requetes se lance les unes après les autres = pas trop performant
    // await getPopularMovies();
    // await getNowPlaying();
    // await getUpComingMovie();
    // await getAnimationMovie();
    // await getComedieMovie();
    // await getDrameMovie();
    // await getDocumetaireMovie();

    await Future.wait([
      getPopularMovies(),
      getNowPlaying(),
      getUpComingMovie(),
      getPopularMovies(),
      getComedieMovie(),
      getDocumetaireMovie(),
      getDrameMovie(),
      getAnimationMovie()
    ]
    );

  }

}