import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ncommerce/providers/cart_provider.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartProvider);
    final totalPrice = ref.watch(cartTotalProvider);

    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Cart:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(height: 10),
          Column(
            children: cartProducts.map((product) {
              return Row(
                children: [
                  Image.asset(product.image, height: 80, width: 80),
                  Text(product.name),
                  Expanded(child: SizedBox()),
                  Text("\$${product.price}"),
                  IconButton(
                    onPressed: () {
                      ref.read(cartProvider.notifier).removeProduct(product);
                    },
                    icon: Icon(Icons.delete, color: Colors.grey[400], size: 20),
                  ),
                ],
              );
            }).toList(),
          ),
          if (!cartProducts.isEmpty) Divider(color: Colors.grey[500]),

          Row(
            children: [
              Text(
                'Total Price - ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(child: SizedBox()),
              Text(
                "\$$totalPrice",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          // Text(
          //   'Total price - £$total',
          //   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          // ),
        ],
      ),
    );
  }
}
