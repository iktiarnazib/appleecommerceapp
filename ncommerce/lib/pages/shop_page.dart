import 'package:flutter/material.dart';
import 'package:ncommerce/components/product_tile.dart';
import 'package:ncommerce/models/product.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<List<dynamic>> productList = [
    [
      'M1 Pro',
      1200,
      'assets/images/m1pro.png',
      'Worlds most powerful Laptop now within your reach, Offer price for Today',
    ],
    [
      'M2 Pro',
      1500,
      'assets/images/m2pro.png',
      'Latest MacBook Pro M2, capable of changing your worldview on Laptops entirely!',
    ],
    [
      'M4 Pro',
      2200,
      'assets/images/M4pro.png',
      'The most portable powerful laptop, 30% FASTER performance from the last Gen.',
    ],
    [
      'M5 Pro',
      2999,
      'assets/images/m5pro.png',
      'Revolutionize your workflow by using the latest M5 Pro Macbook Pro',
    ],
    [
      'IPhone 17 Pro Max',
      999,
      'assets/images/17promax.png',
      'The Latest IPhone 17 Pro Max with 40% Performance increase from the previous generation, Buy Today!',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //searchbar
        Card(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text('Search', style: TextStyle(color: Colors.grey[500])),
                Expanded(child: SizedBox()),
                Icon(Icons.search),
              ],
            ),
          ),
        ),

        //Message
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "Everyone promises privary, but we ensure it!",
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),

        //hot picks
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Hot Picks 🔥',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[600],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return ProductTile(
                product: Product(
                  name: productList[index][0],
                  price: productList[index][1],
                  image: productList[index][2],
                  description: productList[index][3],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
