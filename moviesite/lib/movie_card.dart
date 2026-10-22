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
      width: 300,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}