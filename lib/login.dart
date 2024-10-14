// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seko/homepage.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0), // Padding for top space
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20), // Space between logo and text
                  Text(
                    'Login', // Text below the logo
                    style: GoogleFonts.albertSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.black, // Customize color as needed
                    ),
                  ),
                  const SizedBox(height: 8), // Space between two text elements
                  Text(
                    'Welcome Back!', // Text below the logo
                    style: GoogleFonts.albertSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      color: Colors.black, // Customize color as needed
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTextField(context, "Email"),
                const SizedBox(height: 30), // Space between fields
                // Adding the password field along with the "Forgot Password" button
                _buildPasswordWithForgot(context),
                const SizedBox(
                  height: 100,
                ),
                const SizedBox(height: 150), // Space before button
                Container(
                  width: 300, // Fixed width for all buttons
                  height: 70, // Fixed height for all buttons
                  padding: const EdgeInsets.all(
                      10.0), // Add padding around the button
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCD956), // #FCD956 background color
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the next page when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors
                          .transparent, // Makes button background transparent
                      elevation: 0, // Remove button shadow
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 8), // Space between icon and text
                        Text(
                          "Sign Up ", // Use the parameter buttonText
                          style: GoogleFonts.albertSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black, // Customize color as needed
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildPasswordWithForgot(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.end, // Align the button to the right
      children: [
        _buildTextField(context, "Password"),
        GestureDetector(
          onTap: () {
            // Add your logic for Forgot Password action here
            print("Forgot Password tapped");
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 5, top: 10),
            child: Text(
              'Forgot Password?',
              style: GoogleFonts.albertSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFFCD956), // Color for "Forgot Password"
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildTextField(BuildContext context, String hintText) {
  return Container(
    width: 300,
    height: 70,
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: const Color(0xFFD9D9D9),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: const Color(0xFFFCD956), // Border color
        width: 1.0, // Border width (thin)
      ),
    ),
    child: TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.albertSans(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(0.6),
        ),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
      ),
      style: GoogleFonts.albertSans(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),
  );
}
