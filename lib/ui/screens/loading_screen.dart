import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:netflix_clone/ui/screens/home_screen.dart';
import 'package:netflix_clone/utils/constantes.dart';
import 'package:provider/provider.dart';

import '../../repositories/data_repository.dart';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    iniitData();
  }
  iniitData()async{
    final dataProvider=Provider.of<DataRepository>(context,listen: false);
    // initialise nos differentes listes 
    await dataProvider.initData();
    // Ajouter un temps d'attente de 3 secondes
    await Future.delayed(Duration(seconds: 3));

    // on va sur l'ecran d'accueil
    final route=MaterialPageRoute(builder: (context)=>HomeScreen());
    // pour ne pas avoir la flèche arrière sur l'autre page
    Navigator.pushReplacement(context, route);

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(logo1),
          SpinKitFadingCircle(
            color: kPrimaryColor,
          )
        ],
      ),
    );
  }
}
