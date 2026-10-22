class Movie
{
  final String title;
  final String genre;
  final int releaseYear;
  final int rating;
  final String posterImage;

  const Movie
  ({
    required this.title, 
    required this.genre, 
    required this.releaseYear, 
    required this.rating, 
    required this.posterImage
  });
}

List<Movie> movies = [
  Movie(
    title: 'Sonic the Hedgehog',
    genre: 'action-adventure',
    releaseYear: 2020,
    rating:5,
    posterImage: 'assets/images/sonic1.jpeg'
  ),

  Movie(
    title: 'Sonic the Hedgehog 2',
    genre: 'action-adventure',
    releaseYear: 2022,
    rating:4,
    posterImage: 'assets/images/sonic2.jpeg'
  ),

  Movie(
    title: 'Sonic the Hedgehog 3',
    genre: 'action-adventure',
    releaseYear: 2024,
    rating:3,
    posterImage: 'assets/images/sonic3.jpeg'
  ),

  Movie(
    title: "The emperor's new groove",
    genre: 'comedy',
    releaseYear: 2000,
    rating:5,
    posterImage: 'assets/images/the_emperor_new_groove.jpeg'
  ),

  Movie(
    title: 'Mulan',
    genre: 'musical',
    releaseYear: 1998,
    rating:5,
    posterImage: 'assets/images/mulan.jpeg'
  ),

  Movie(
    title: 'Mulan 2',
    genre: 'adventure',
    releaseYear: 2004,
    rating:3,
    posterImage: 'assets/images/mulan2.jpg'
  ),

  Movie(
    title: 'Toy Story',
    genre: 'comedy',
    releaseYear: 1995,
    rating:4,
    posterImage: 'assets/images/toy_story.jpg'
  ),
  
  Movie(
    title: 'The Incredibles',
    genre: 'action',
    releaseYear: 2004,
    rating:4,
    posterImage: 'assets/images/the_incredibles.jpg'
  ),
];