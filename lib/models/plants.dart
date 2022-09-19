class Plant {
  final int plantId;
  final String price;
  final double rating;
  final int humidity;
  final String temperature;
  final String category;
  final String plantName;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;

  Plant(
      {required this.plantId,
      required this.price,
      required this.category,
      required this.plantName,
      required this.rating,
      required this.humidity,
      required this.temperature,
      required this.imageURL,
      required this.isFavorated,
      required this.decription,
      required this.isSelected});

  //List of Plants data
  static List<Plant> plantList = [
    Plant(
        plantId: 0,
        price: 'Rp 20.000 - Rp 2.000.000',
        category: 'Indoor',
        plantName: 'Aglaonema Big Roy',
        rating: 4.8,
        humidity: 50,
        temperature: '24 - 27',
        imageURL: 'assets/images/plant-three.png',
        isFavorated: true,
        decription:
            'Aglonema Big Roy adalah tanaman dari golongan spesies talas-talasan.'
            'Tanaman ini mudah tumbuh di daerah dengan kadar kelembaban yang tinggi.',
        isSelected: false),
    Plant(
        plantId: 1,
        price: 'Rp 12.000 - Rp 800.000',
        category: 'Outdoor',
        plantName: 'Philodendron Mercy',
        rating: 4.6,
        humidity: 56,
        temperature: '19 - 22',
        imageURL: 'assets/images/plant-two.png',
        isFavorated: false,
        decription:
            'Philodendron Mercy adalah jenis tanaman yang tumbuh di ekosistem hutan tropis.'
            'Tempat hidup utamanya apabila di alam yaitu seperti tempat lembab, tepi sungai maupun di sekitaran rawa.',
        isSelected: false),
    Plant(
        plantId: 2,
        price: 'Rp 50.000 - Rp 2.600.000',
        category: 'Indoor',
        plantName: 'Syngonium Pink Spot',
        rating: 4.7,
        humidity: 50,
        temperature: '16 - 27',
        imageURL: 'assets/images/plant-one.png',
        isFavorated: false,
        decription:
            'Syngonium Pink Spot adalah tanaman hias yang relatif langka yang membutuhkan penyiraman secara teratur untuk berkembang'
            'Tanaman ini menyukai tanah yang berdrainase baik.',
        isSelected: false),
  ];

  //Get the favorated items
  static List<Plant> getFavoritedPlants() {
    List<Plant> _travelList = Plant.plantList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

  //Get the cart items
  static List<Plant> addedToCartPlants() {
    List<Plant> _selectedPlants = Plant.plantList;
    return _selectedPlants
        .where((element) => element.isSelected == true)
        .toList();
  }
}
