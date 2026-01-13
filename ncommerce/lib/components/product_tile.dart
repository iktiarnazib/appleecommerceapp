import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ncommerce/models/product.dart';
import 'package:ncommerce/providers/cart_provider.dart';

class ProductTile extends ConsumerStatefulWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  @override
  ConsumerState<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends ConsumerState<ProductTile> {
  @override
  Widget build(BuildContext context) {
    final cartProduct = ref.watch(cartProvider);

    return Container(
      margin: EdgeInsets.only(left: 15, right: 5),
      width: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[400],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(widget.product.image),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        widget.product.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //name + price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //shoe name
                      FittedBox(
                        child: Text(
                          widget.product.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      //shoe price
                      Text(
                        "\$${widget.product.price}",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
                //plus button
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (!cartProduct.contains(widget.product)) {
                              ref
                                  .read(cartProvider.notifier)
                                  .addProduct(widget.product);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog.adaptive(
                                    title: Text('Added Successfully!'),
                                    content: Text(
                                      'Your Item has been added to the cart successfully, Please switch the the cart option for checkout!',
                                    ),
                                    actions: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            'Close',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                            if (cartProduct.contains(widget.product)) {
                              ref
                                  .read(cartProvider.notifier)
                                  .removeProduct(widget.product);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog.adaptive(
                                    title: Text('Removed Successfully!'),
                                    content: Text(
                                      'Your Item has been removed from the cart successfully, add new one and checkout!',
                                    ),
                                    actions: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            'Close',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          icon: cartProduct.contains(widget.product)
                              ? Icon(Icons.delete, color: Colors.red)
                              : Icon(Icons.add, color: Colors.white),
                        ),
                        if (!cartProduct.contains(widget.product))
                          Text(
                            'Add to cart',
                            style: TextStyle(color: Colors.white),
                          ),
                        if (cartProduct.contains(widget.product))
                          Text('Remove', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
