import 'package:ncommerce/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

//List of Products
List<Product> productList = [
  Product(
    id: '1',
    name: 'M1 Pro',
    price: 1200,
    image: 'assets/images/m1pro.png',
    description:
        'Worlds most powerful Laptop now within your reach, Offer price for Today',
  ),
  Product(
    id: '2',
    name: 'M2 Pro',
    price: 1500,
    image: 'assets/images/m2pro.png',
    description:
        'Latest MacBook Pro M2, capable of changing your worldview on Laptops entirely!',
  ),
  Product(
    id: '3',
    name: 'M4 Pro',
    price: 2200,
    image: 'assets/images/M4pro.png',
    description:
        'The most portable powerful laptop, 30% FASTER performance from the last Gen.',
  ),
  Product(
    id: '4',
    name: 'M5 Pro',
    price: 2999,
    image: 'assets/images/m5pro.png',
    description:
        'Revolutionize your workflow by using the latest M5 Pro Macbook Pro',
  ),
  Product(
    id: '5',
    name: 'IPhone 17 Pro Max',
    price: 999,
    image: 'assets/images/17promax.png',
    description:
        'The Latest IPhone 17 Pro Max with 60% Performance increase from the previous generation, Buy Today!',
  ),
];

@riverpod
List<Product> product(ref) {
  return productList;
}
