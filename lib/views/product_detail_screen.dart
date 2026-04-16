import 'package:flutter/material.dart';
import 'package:satishop/models/satellite_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final SatelliteModel product;
  final Set<int> cartIds;

  const ProductDetailScreen({
    super.key,
    required this.product,
    required this.cartIds,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Back", style: TextStyle(color: Colors.deepPurple)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: widget.product.id,
              child: Image.asset(
                widget.product.fullAssetPath,
                height: 350,
                width: double.infinity,
                cacheHeight: 350,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    widget.product.price,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),

                  SizedBox(height: 16),

                  Text(
                    widget.product.description,
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
                      setState(() {
                        widget.cartIds.add(widget.product.id);
                      });

                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("Added to Cart!")));
                    },
                    child: Text("Add to Cart"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
