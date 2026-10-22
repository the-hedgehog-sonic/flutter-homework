import 'package:flutter/material.dart';
import 'movie.dart';


class MovieCard extends StatelessWidget
{
  final Movie movie;
  const MovieCard(this.movie, {super.key});

  @override
  Widget build(BuildContext context)
  {
    return Container
    (
      clipBehavior: Clip.antiAlias,
      
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
        borderRadius: BorderRadius.circular(20),
      ),
      
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 2 / 3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(movie.posterImage, fit: BoxFit.cover),

                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(movie.rating.toString(),),
                  ),
                ),

                Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(Icons.bookmark_border, color: Colors.white,),
                ),

                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Text(movie.releaseYear.toString(), style: TextStyle(color: Colors.white,))
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(movie.title, style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold,)),
                Text(movie.genre, style: TextStyle(fontWeight: FontWeight.bold,)),
              ],
            ),
          )
        ],
      ),
    );
  }
}



