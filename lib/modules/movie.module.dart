class Movie {
  final String name;
  final String coverPath;
  final String videoPath;
  final String imagePAth;
  final String category;
  final String description;
  final int year;
  final Duration duration;

  Movie(
      {required this.name,
      required this.coverPath,
      required this.videoPath,
      required this.imagePAth,
      required this.category,
      required this.year,
      required this.description,
      required this.duration});
  static List<Movie> movies = [
    Movie(
        name: 'The Dune',
        coverPath: 'assets/images/Dune.mp4',
        imagePAth: 'assets/images/The_Dune.jpg',
        videoPath: 'assets/videos/TheDune.mp4',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
        category: 'Action',
        year: 2021,
        duration: const Duration(hours: 2, minutes: 34)),
        Movie(
        name: 'School Of Magical Animals',
        coverPath: 'assets/images/School.mp4',
        videoPath: 'assets/videos/SchoolofMagicalAnimals.mp4',
        imagePAth: 'assets/images/SOMA.jpg',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
        category: 'Action',
        year: 2023,
        duration: const Duration(hours: 2, minutes: 27)),
        Movie(
        name: 'Knights Of Zodiac',
        coverPath: 'assets/images/KOZ.mp4',
        videoPath: 'assets/videos/KnightsOfZodiac.mp4',
        imagePAth: 'assets/images/KOZ.jpg',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
        category: 'Thrillar - Action',
        year: 2023,
        duration: const Duration(hours: 2, minutes: 20)),

  ];
}
