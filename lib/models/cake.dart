import 'package:advmobprog_midterms_tp03_molina/models/cake_flavor.dart';

class Cake {
  static List<CakeFlavor> flavors = [
    CakeFlavor(
      name: 'Brown Butter Vanilla',
      description: 'Elevated vanilla with nutty brown butter notes and a salted caramel drip.',
      imagePath: 'assets/flavors/vanilla.jpg',
      basePrice: 25.00,
    ),
    CakeFlavor(
      name: 'Black Forest 2.0',
      description: 'Dark chocolate layers with tart cherry compote and mascarpone cream.',
      imagePath: 'assets/flavors/forest.jpg',
      basePrice: 30.00,
    ),
    CakeFlavor(
      name: 'Lemon Raspberry Ricotta',
      description: 'Moist ricotta crumb with zesty lemon and fresh raspberry pops.',
      imagePath: 'assets/flavors/lemon.jpg',
      basePrice: 28.00,
    ),
    CakeFlavor(
      name: 'Spiced Chai & Honey',
      description: 'Aromatic chai spices layered with smooth, golden honey buttercream.',
      imagePath: 'assets/flavors/honey.jpg',
      basePrice: 27.00,
    ),
    CakeFlavor(
      name: 'Ultimate Chocolate',
      description: 'Decadent triple chocolate mousse with a rich dark chocolate ganache.',
      imagePath: 'assets/flavors/choco.jpg',
      basePrice: 32.00,
    ),
  ];

}