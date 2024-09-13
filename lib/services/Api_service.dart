import 'package:dio/dio.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/models/person.dart';
import 'package:netflix_clone/services/api.dart';

class APIService{

  final API api=API();
  final Dio dio=Dio();


  Future<Response>getData(String path,{Map<String,dynamic>?params})async{

    // Construction de l'url
    String url=api.baseURL+path;
    // parametres communs a toutes les requetes
    Map<String,dynamic>query=

    {
     'api_key':api.apiKey,
      'language':"fr-FR",
    };
    // cas ou il y'a d'autres parametres en plus que ceux habituels
    if(params !=null){
      query.addAll(params);
    }
    // appel
    final reponse=await dio.get(url,queryParameters: query);
    if(reponse.statusCode==200){
      return reponse;
    }
    // cas d'erreur
    else{
      throw reponse;
    }


  }

  // Fonctions permettant  de construire les requêtes pour les categories de films

  Future<List<Movie>>getPopularMovies({required int pageNumber})async{
    Response response=await getData('/movie/popular',params: {
      'page':pageNumber,
    });
    if(response.statusCode==200){
      Map data=response.data;
      List<dynamic>results=data['results'];
      List<Movie>movies=[];
      for(Map<String,dynamic> json in results){
        Movie movie=Movie.fromJson(json);
        movies.add(movie);
      }
      return movies;

    }
    else {
      throw response;
    }

}

  Future<List<Movie>>getUpComingMovies({required int pageNumber})async{
    Response response=await getData('/movie/upcoming',params: {
      'page':pageNumber,
    });
    if(response.statusCode==200){
      Map data=response.data;
      List<dynamic>results=data['results'];
      List<Movie>movies=[];
      for(Map<String,dynamic> json in results){
        Movie movie=Movie.fromJson(json);
        movies.add(movie);
      }
      return movies;

    }
    else {
      throw response;
    }

  }

  Future<List<Movie>>getNowPlaying({required int pageNumber})async{
    Response response=await getData('/movie/top_rated',params: {
      'page':pageNumber,
    });
    if(response.statusCode==200){
      Map data=response.data;
      //methode simple
      // List<Movie>movies=data['results'].map<Movie>
      //   ((dynamic moviejson)=>Movie.fromJson(moviejson)).toList();
      List<dynamic>results=data['results'];
      List<Movie>movies=[];
      for(Map<String,dynamic> json in results){
        Movie movie=Movie.fromJson(json);
        movies.add(movie);
      }
      return movies;

    }
    else {
      throw response;
    }

  }
  Future<List<Movie>>getAnimationMovie({required int pageNumber})async{
    Response response=await getData('/discover/movie',params: {
      'page':pageNumber,
      'with_genres':"16",// 16 qui corresponnd à la categories animation


    });
    if(response.statusCode==200){
      Map data=response.data;
      List<dynamic>results=data['results'];
      List<Movie>movies=[];
      for(Map<String,dynamic> json in results){
        Movie movie=Movie.fromJson(json);
        movies.add(movie);
      }
      return movies;

    }
    else {
      throw response;
    }

  }
  Future<List<Movie>>getComedieMovie({required int pageNumber})async{
    Response response=await getData('/discover/movie',params: {
      'page':pageNumber,
      'with_genres':"35",// 35 qui corresponnd à la categorie Comedie


    });
    if(response.statusCode==200){
      Map data=response.data;
      List<dynamic>results=data['results'];
      List<Movie>movies=[];
      for(Map<String,dynamic> json in results){
        Movie movie=Movie.fromJson(json);
        movies.add(movie);
      }
      return movies;

    }
    else {
      throw response;
    }

  }

  Future<List<Movie>>getDrameMovie({required int pageNumber})async{
    Response response=await getData('/discover/movie',params: {
      'page':pageNumber,
      'with_genres':"18",// 18 qui corresponnd à la categories Drame


    });
    if(response.statusCode==200){
      Map data=response.data;
      List<dynamic>results=data['results'];
      List<Movie>movies=[];
      for(Map<String,dynamic> json in results){
        Movie movie=Movie.fromJson(json);
        movies.add(movie);
      }
      return movies;

    }
    else {
      throw response;
    }

  }

  Future<List<Movie>>getDocumentaireMovie({required int pageNumber})async{
    Response response=await getData('/discover/movie',params: {
      'page':pageNumber,
      'with_genres':"99",// 99 qui corresponnd à la categories Documentaire


    });
    if(response.statusCode==200){
      Map data=response.data;
      List<dynamic>results=data['results'];
      List<Movie>movies=[];
      for(Map<String,dynamic> json in results){
        Movie movie=Movie.fromJson(json);
        movies.add(movie);
      }
      return movies;

    }
    else {
      throw response;
    }

  }

  Future<Movie>getMovieDetails({required Movie movie}) async{

    Response response=await getData('/movie/${movie.id}');
    if(response.statusCode==200){
      Map<String,dynamic>data=response.data;
      var genres=data['genres'] as List;
      List<String> genreList=genres.map((item) => item['name'] as String).toList();
      Movie newMovie=movie.copyWith(
        genres: genreList,
        releaseDate: data['release_date'],
        vote: data['vote_average']
      );
      return newMovie;

    }
    else{
      throw response;
    }

  }

  Future<Movie>getMovieVideos({required Movie movie})async {
    Response response = await getData('/movie/${movie.id}/videos');
    if (response.statusCode == 200) {
      Map<String, dynamic>data = response.data;
      List<String> videoKeys = data['results'].map<String>((
          videoJson) => videoJson['key'] as String).toList();
      return movie.copyWith(videos: videoKeys);
    }
    else{
      throw response;
    }

  }

  Future<Movie> getMovieCard({required Movie movie })async{
    Response response = await getData('/movie/${movie.id}/credits');
    if (response.statusCode == 200) {
      Map data = response.data;
      List<Person> casting = data['cast'].map<Person>((
          personJson) => Person.fromJson(personJson)).toList();
      return movie.copyWith(casting: casting);
    }

    else{
      throw response;
    }


  }

  Future <Movie> getMovieImage({required Movie movie})async{
    Response response = await getData('/movie/${movie.id}/images',params: {
      'include_image_language':'null'
    });
    if(response.statusCode==200){
      Map data=response.data;
      List<String>imagePath=data['backdrops'].map<String>((imageJson){
        return imageJson['file_path'] as String;
      }).toList();

      return movie.copyWith(images: imagePath);

    }
    else{
      throw response;
    }


  }

  // combiner toutes les requetes en un appel


  Future <Movie> getMovieInfo({required Movie movie})async{
    Response response = await getData('/movie/${movie.id}',params: {
      'include_image_language':'null',
      'append_to_response':"videos,images,credits"
    });
    if(response.statusCode==200){
      Map data=response.data;

      // on recupere les genres
      var genres=data['genres'] as List;
      List<String> genreList=genres.map((item) => item['name'] as String).toList();

      // on recupere les vidéos
      List<String> videoKeys = data['videos']['results'].map<String>((
          videoJson) => videoJson['key'] as String).toList();

      // on recupere les photos
      List<String>imagePath=data['images']['backdrops'].map<String>((imageJson){
        return imageJson['file_path'] as String;
      }).toList();
      // on recupere le casting
      List<Person> casting = data['credits']['cast'].map<Person>((
          personJson) => Person.fromJson(personJson)).toList();


      return movie.copyWith(images: imagePath,
          videos: videoKeys,
          casting: casting,
          genres: genreList,
          releaseDate: data['release_date'],
          vote: data['vote_average']);

    }
    else{
      throw response;
    }


  }

  }

