class CartList {
  static List<CartModel> cartList = [
    CartModel(
      image: 'assets/icons/taxi.png',
      title: 'Economy',
      carDkk: '223.3 DKK',
    ),
    CartModel(
      image: 'assets/icons/taxi 2.png',
      title: 'Premium',
      carDkk: '323.3 DKK',
    ),
    CartModel(
      image: 'assets/icons/taxi 3.png',
      title: 'Luxury',
      carDkk: '423.3 DKK',
    ),
  ];
}

class CartModel {
  final String image;
  final String title;
  final String carDkk;

  CartModel({required this.image, required this.title, required this.carDkk});
}
