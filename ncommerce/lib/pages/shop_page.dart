import 'package:flutter/material.dart';
import 'package:ncommerce/components/product_tile.dart';
import 'package:ncommerce/models/product.dart';
import 'package:ncommerce/providers/product_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShopPage extends ConsumerStatefulWidget {
  const ShopPage({super.key});

  @override
  ConsumerState<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends ConsumerState<ShopPage> {
  @override
  Widget build(BuildContext context) {
    final allProducts = ref.watch(productProvider);

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
            itemCount: allProducts.length,
            itemBuilder: (context, index) {
              return ProductTile(
                product: Product(
                  name: allProducts[index].name,
                  price: allProducts[index].price,
                  image: allProducts[index].image,
                  description: allProducts[index].description,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
