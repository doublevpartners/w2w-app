class PlaceModel {
  String name;
  String image;
  double rating;
  bool isPremium;

  PlaceModel(
      {required this.name,
      required this.image,
      required this.rating,
      required this.isPremium});

  static List<PlaceModel> places_list = [
    PlaceModel(
        name: 'Palacio Real de Madrid',
        image: 'assets/places/image1.jpg',
        isPremium: false,
        rating: 4.8),
    PlaceModel(
        name: 'Estadio Santiago Bernabéu',
        image: 'assets/places/image2.jpg',
        isPremium: true,
        rating: 4.8),
    PlaceModel(
        name: 'Gran vía',
        image: 'assets/places/image3.jpg',
        isPremium: true,
        rating: 4.8),
    PlaceModel(
        name: 'Plaza Mayor',
        image: 'assets/places/image4.jpg',
        isPremium: true,
        rating: 4.8),
    PlaceModel(
        name: 'Plaza Cibeles',
        image: 'assets/places/image5.jpg',
        isPremium: true,
        rating: 3.1),
    PlaceModel(
        name: 'Puerta del Sol',
        image: 'assets/places/image6.jpg',
        isPremium: true,
        rating: 4.1),
  ];
}
