import 'package:flutter/material.dart';
import 'package:satishop/components/product_card.dart';
import 'package:satishop/models/satellite_model.dart';

class CartScreen extends StatefulWidget {
  final List<SatelliteModel> products;
  final Set<int> cartIds;

  const CartScreen({super.key, required this.products, required this.cartIds});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = widget.products
        .where((product) => widget.cartIds.contains(product.id))
        .toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Your Cart",
          style: TextStyle(color: Colors.deepPurpleAccent),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: cartProducts.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              size: 64,
                              color: Colors.deepPurpleAccent,
                            ),

                            SizedBox(height: 20),

                            Text(
                              "Your cart is empty.",
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          final product = cartProducts[index];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    product.fullAssetPath,
                                    cacheHeight: 250,
                                    height: 70,
                                    width: 70,
                                  ),
                                ),

                                SizedBox(width: 16),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name,
                                        maxLines: 1,
                                        overflow: TextOverflow
                                            .ellipsis, // prevents text overlap
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        product.price,
                                        style: const TextStyle(
                                          color: Colors.deepPurpleAccent,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.cartIds.remove(product.id);
                                    });
                                  },
                                  icon: Icon(Icons.remove_circle_outline),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: cartProducts.length,
                      ),
              ),

              SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Added to Cart!")));
                },
                child: Text("Proceed to checkout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
