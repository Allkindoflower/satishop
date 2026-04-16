import 'package:flutter/material.dart';
import 'package:satishop/components/product_card.dart';
import 'package:satishop/models/satellite_model.dart';
import 'package:satishop/services/api_service.dart';
import 'package:satishop/views/cart_screen.dart';
import 'package:satishop/views/product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SatelliteModel> satelliteProducts = [];
  final ApiService apiService = ApiService();
  bool isLoading = false;
  String errorMessage = "";
  Set<int> cartIds = {};

  @override
  void initState() {
    loadProducts();
    super.initState();
  }

  Future<void> loadProducts() async {
    try {
      setState(() => isLoading = true);
      final data = await apiService.fetchSatelliteProducts();
      setState(() {
        satelliteProducts = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = "Unable to retrieve data.";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SatiShop",
                    style: TextStyle(
                      color: Color(0xffbe78ff),
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(
                            products: satelliteProducts,
                            cartIds: cartIds,
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.shopping_cart_outlined),
                    iconSize: 32,
                    color: Colors.deepPurpleAccent,
                  ),
                ],
              ),

              SizedBox(height: 16),
              Text(
                "Have a fortune to spend? These might interest you.",
                style: TextStyle(fontSize: 16, color: Color(0xffbe78ff)),
              ),

              SizedBox(height: 14),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white24),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Search for satellites...",
                    hintStyle: TextStyle(color: Colors.white54),
                    prefixIcon: Icon(Icons.search, color: Colors.white54),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),

              SizedBox(height: 16),

              Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage("assets/images/coolsatellitepic.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: 16),

              if (isLoading)
                Center(child: CircularProgressIndicator.adaptive())
              else if (errorMessage.isNotEmpty)
                Center(child: Text(errorMessage))
              else
                Expanded(
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Color(0xffbe78ff),
                          ),
                        )
                      : GridView.builder(
                          itemCount: satelliteProducts.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 0.75,
                              ),
                          itemBuilder: (context, index) {
                            final product = satelliteProducts[index];

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailScreen(
                                      product: product,
                                      cartIds: cartIds,
                                    ),
                                  ),
                                );
                              },
                              child: ProductCard(product: product),
                            );
                          },
                        ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
