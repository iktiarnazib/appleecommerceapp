import 'package:ncommerce/models/product.dart';

class Cart {
  //list of products for sell
  List<Product> productList = [
    Product(
      name: 'M1 Pro',
      price: 1200,
      image: 'assets/images/m1pro.png',
      description:
          'Worlds most powerful Laptop now within your reach, Offer price for Today',
    ),
    Product(
      name: 'M2 Pro',
      price: 1500,
      image: 'assets/images/m2pro.png',
      description:
          'Latest MacBook Pro M2, capable of changing your worldview on Laptops entirely!',
    ),
    Product(
      name: 'M4 Pro',
      price: 2200,
      image: 'assets/images/M4pro.png',
      description:
          'The most portable powerful laptop, 30% FASTER performance from the last Gen.',
    ),
    Product(
      name: 'M5 Pro',
      price: 2999,
      image: 'assets/images/m5pro.png',
      description:
          'Revolutionize your workflow by using the latest M5 Pro Macbook Pro',
    ),
    Product(
      name: 'IPhone 17 Pro Max',
      price: 999,
      image: 'assets/images/17promax.png',
      description:
          'The Latest IPhone 17 Pro Max with 40% Performance increase from the previous generation, Buy Today!',
    ),
  ];

  //list of items in the cart
  List<Product> userCart = [];

  //get list of products for sell
  List<Product> getProductList() {
    return productList;
  }

  //get cart
  List<Product> getUserCart() {
    return userCart;
  }

  //add item to cart
  void addItemToCart(Product product) {
    userCart.add(product);
  }

  //remove item to cart
  void removeItemToCart(Product product) {
    userCart.remove(product);
  }
}
