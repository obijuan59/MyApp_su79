import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int qty = 0;

  void increase() {
    setState(() {
      qty++;
    });
  }

  void decrease() {
    setState(() {
      if (qty > 0) qty--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 4,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: Text(
          'Dashboard',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Counter Card
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.deepPurple,
                      size: 60,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Item Quantity",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Counter Controls
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Decrease Button
                        IconButton(
                          onPressed: decrease,
                          icon: const Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                        const SizedBox(width: 20),

                        // Quantity Display
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 18,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Text(
                            "$qty",
                            style: GoogleFonts.poppins(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        const SizedBox(width: 20),
                        // Increase Button
                        IconButton(
                          onPressed: increase,
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.green,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Summary Text
            Text(
              "You have added $qty item(s).",
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[800]),
            ),
          ],
        ),
      ),

      // Floating Action Butto
    );
  }
}
