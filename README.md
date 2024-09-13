# netflix_clone
 Un Clone de Netflix utilisant l'api the moviedb

Comment j’ai reproduit netflix avec l’api movie db 

1-Créér un compte pour avoir une clé d’api 

2- explorer et voir les differentes actions que l’api propose

3- elaboration du format des requêtes :
	A l’issu de cette analyse il en ressort que la requête est structurée comme suit :
a)	Pour récuperer les listes de films ou autres
'https://api.themoviedb.org/3' (1ere partie) suivi du path et des parametres

Path : chemin indiquant ce qu’on veut recuperer exemple : /movie/popular( pour les films populaires)
Paramètres : on en distingue 2 :
- Les paramètres obligatoires : api_key, language
-les paramètres spécifiques souvent facultatifs : page,with_genres,include_image_language

b)	Recuperer les images ou videos 

1ere partie de la requête : 'https://image.tmdb.org/t/p/w500/'(image)
https://www.youtube.com/watch?v=' (video)


2eme partie : posterpath qu’on recupère dans l’appel api 

4) Elaboration du model 
La classe Movie qui a les attributs id, name,description,vote….
La classe Person avec les attributs name , characherName,imageUrl….
Les méthodes copyWith et FromJson pour les 2 classes.
CopyWith : retourne une copie de l’objet Person ou Movie avec des nouvelles valeurs des attributs passés en paramètres
FromJson : Permet de convertir le fichier(le map<String,dynamic> récupéré) Json lors du resultat de L’appel API en Objet map ou en objet Person ou Movie

5) Elaboration des UI
Il y’a 3ui  dans l’application : UI de chargement, UI d’acceuil , UI des details de la video sélectionné

UI de chargement : le logo Netflix suivi  de L’animation de chargement
UI d’Acceuil : une image est sur l’accueil les autres images sont rangés par catégorie :Animation ,Drame,Documentaire….
Ui Details : elle s’execute lorsqu’on clique sur une video , elle comprend une video chargée depuis yotube si disponible , le titre , les détails de la vidéo , les genres de la video , la description , la liste des acteurs et la liste des images du film si disponible 

6) Les Dépendances
Provider ,google_fonts, flutter_spinkit(pour les animations de chargement), cached_network_image
,youtube_player_flutter

