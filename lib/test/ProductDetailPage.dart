// ignore_for_file: file_names, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailPage extends StatefulWidget {
  final String image;
  final String label;
  final double price; // Ensure price is a double

  const ProductDetailPage({
    super.key,
    required this.image,
    required this.label,
    required this.price, // Price is passed as a double
  });

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _quantity = 1; // Quantity is an integer
  late double _totalPrice; // Total price initialized in initState

  @override
  void initState() {
    super.initState();
    _totalPrice = widget.price; // Set the initial total price
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
      _totalPrice = _quantity * widget.price;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
        _totalPrice = _quantity * widget.price;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title at the top
            const SizedBox(height: 75),
            Column(
              children: [
                Text(
                  widget.label,
                  style: GoogleFonts.albertSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 125),
              ],
            ),

            // Centered Image
            Center(
              child: Image.asset(
                widget.image,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 45),
            // Quantity Selector and Price
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Minus button
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: _decrementQuantity,
                  iconSize: 32,
                  color: Colors.red,
                ),

                // Total Price
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    '\$${_totalPrice.toStringAsFixed(2)}', // Ensure total price is displayed as string with 2 decimal places
                    style: GoogleFonts.albertSans(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),

                // Plus button
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _incrementQuantity,
                  iconSize: 32,
                  color: Colors.green,
                ),
              ],
            ),

            // Add to Cart Slider
            Column(
              children: [
                const SizedBox(height: 200),

                // Circular button with image and text aligned to the right
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Add your button action here
                      print('Add to Cart button tapped');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0), // Padding for the button
                      decoration: BoxDecoration(
                        color: const Color(
                            0xFFD9D9D9), // Background color for the button
                        borderRadius: BorderRadius.circular(
                            60), // Rounded corners for the button
                        border: Border.all(
                          color: const Color(0xFFFCD956),
                        ), // Optional border for the button
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.end, // Align content to the right
                        children: [
                          // "Add to Cart" text
                          Text(
                            "Add to Cart",
                            style: GoogleFonts.albertSans(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(
                              width:
                                  16), // Spacing between the text and the circle

                          // Circle-shaped container with an image inside
                          Container(
                            width: 60, // Width of the circle container
                            height: 60, // Height of the circle container
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(
                                  0xFFFCD956), // Background color for the circle
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  8.0), // Padding inside the circle
                              child: Image.asset(
                                'assets/47.png', // Replace with the correct image path
                                fit: BoxFit
                                    .cover, // Ensure the image fits inside the circle
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
