class AddOn {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  bool isSelected;

  AddOn({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    this.isSelected = false,
  });

  static List<AddOn> get items => [
        AddOn(
          name: "Happy Birthday Topper",
          description: "Elegant gold acrylic lettering to make the occasion official.",
          imagePath: "assets/addons/topper.jpg",
          price: 50.00,
        ),
        AddOn(
          name: "Blank Greeting Card",
          description: "A premium card for your personalized handwritten message.",
          imagePath: "assets/addons/card.jpg",
          price: 25.00,
        ),
        AddOn(
          name: "Premium Candle Set",
          description: "A set of 24 sleek, drip-less candles in a variety of colors.",
          imagePath: "assets/addons/candle.jpg",
          price: 100.00,
        ),
      ];
}

