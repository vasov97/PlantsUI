class Plant {
  final String name;
  final String path;
  final double price;

  const Plant(this.name, this.path, this.price);

  static const plantList = [
    Plant('Sansevieria', 'assets/01.png', 4.2),
    Plant('Jade plant', 'assets/02.png', 3.6),
    Plant('Lucky bamboo', 'assets/03.png', 3.0),
    Plant('Aglaonema', 'assets/04.png', 5.5),
    Plant('Devil\'s ivy', 'assets/05.png', 5.0),
  ];
}
