class Movie {
  final String name;
  final String coverPath;
  final String videoPath;
  final String category;
  final int year;
  final Duration duration;

  Movie(
      {required this.name,
      required this.coverPath,
      required this.videoPath,
      required this.category,
      required this.year,
      required this.duration});
  static List<Movie> movies = [
    Movie(
        name: 'The Dune',
        coverPath: 'assets/images/Dune.mp4',
        videoPath: 'assets/videos/The Dune.mp4',
        category: '', 
        year: 0,
        duration: const Duration(hours: 2, minutes: 34)),
    Movie(
        name: 'Knights Of Zodiac',
        coverPath: 'assets/images/zdiac.mp4',
        videoPath: 'assets/videos/Knights Of Zodiac.mp4',
        category: '',
        year: 0,
        duration: const Duration(hours: 2, minutes: 34)),
    Movie(
        name: 'School Of Magical Animals',
        coverPath: 'assets/images/School.mp4',
        videoPath: 'assets/videos/School of Magical Animals.mp4',
        category: '',
        year: 0,
        duration: const Duration(hours: 2, minutes: 34)),
  ];
}
