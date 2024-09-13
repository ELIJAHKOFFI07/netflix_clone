import 'package:dio/dio.dart';
import 'package:netflix_clone/models/person.dart';

import '../services/api.dart';

class Movie{
  // declarations des attributs permanent
  final int id;
  final String name;
  final String description;
  // declaration des attributs falcultatifs
  final String ?posterPath;
  final String? releaseDate;
  final double ?vote;
  final List<String>? genres;
  final List<String>? videos;
  final List<Person>? casting;
  final List<String>? images;

  Movie({this.releaseDate, this.vote, this.genres, required this.id, required this.name, required this.description,  this.posterPath,this.videos,this.images,this.casting});
  // transforme un Map<String, dynamic> en Movie
  factory Movie.fromJson(Map<String, dynamic> map) {
    return Movie(
      id: map['id'],
      name: map['title'],
      description: map['overview'],
      posterPath: map['poster_path'],

    );
  }
  Movie copyWith(
      {int? id,
        String? name,
        String? description,
        String? posterPath,
        List<String>? genres,
        String? releaseDate,
        double? vote,
        List<String>? videos,
        List<String>? images,
      List<Person>? casting
      }) {
    return Movie(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      posterPath: posterPath ?? this.posterPath,
      genres: genres ?? this.genres,
      releaseDate: releaseDate ?? this.releaseDate,
      vote: vote ?? this.vote,
      videos: videos ?? this.videos,
      casting: casting ?? this.casting,
      images: images ?? this.images,
    );
  }

  String posterURL() {
    API api = API();
    return api.baseImageURL + posterPath!;
  }

  String reformatGenres(){
    String categories="";
    for(int i=0;i<genres!.length;i++){
      if(i==genres!.length-1){
        categories=categories+ genres![i];
      }
      else{
categories='$categories${genres![i]} ,';
      }

    }
    return categories;

  }


}