import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:netflix_clone/utils/constantes.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class MyVideoPlayer extends StatefulWidget {
  final String movieId;
  const MyVideoPlayer({super.key, required this.movieId});

  @override
  State<MyVideoPlayer> createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {

    YoutubePlayerController?youtubePlayerController;

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    youtubePlayerController=YoutubePlayerController(
        initialVideoId: widget.movieId,
      // definir les parametres
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        hideThumbnail: false
      )

    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    youtubePlayerController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return (youtubePlayerController==null)
        ? Center(child: SpinKitFadingCircle(
      color: kPrimaryColor,
      size: 20,

    )
    ):YoutubePlayer(
        controller: youtubePlayerController!,
      // changer la couleur des progress
      progressColors: ProgressBarColors(handleColor: kPrimaryColor,playedColor: kPrimaryColor),
// ce qui se passe lorsque la video finit
      onEnded: (YoutubeMetaData mmeta){
          youtubePlayerController!.play();
          youtubePlayerController!.pause();


},
    );

  }
}
