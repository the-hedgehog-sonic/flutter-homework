import 'package:flutter/material.dart';
import 'movie.dart';
import 'movie_card.dart';

//should return our scaffold widget
class HomePage extends StatefulWidget
{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>
{
  bool isGrid = false;
  String searchText = '';
  final List<Movie> movieList = movies;

  @override
  Widget build(BuildContext context)
  {
    final List<Movie> searchedMovies = [];
    for (final m in movies) 
    {
      if (m.title.toLowerCase().contains(searchText.toLowerCase())) 
      {
        searchedMovies.add(m);
      }
    }

    return Scaffold
    (
      appBar: AppBar(
        title: const Text("EgyBest"),
        actions: [
          IconButton(
            icon: Icon(isGrid ? Icons.view_list : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGrid = !isGrid;
              });
            },
          ),
        ],
      ),
      
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
          ),

          Expanded(
            child: isGrid ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, childAspectRatio: 0.55,), 
              itemCount: searchedMovies.length,
              itemBuilder: (context, index){
                return MovieCard(searchedMovies[index]);
              },
            ) 

            : ListView.builder(
              itemCount: searchedMovies.length,
              itemBuilder: (context, index){
                return MovieCard(searchedMovies[index]);
              }
            )
          ),
        ],
      )
    );
  }
}