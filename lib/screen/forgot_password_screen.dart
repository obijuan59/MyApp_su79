import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A1B9A), Color(0xFF8E24AA)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Form(
                key: _formKey, // ✅ wrap with Form
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icon
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: const Color(0xFF6A1B9A),
                      child: const Icon(
                        Icons.refresh_rounded,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Title
                    Text(
                      "Reset Password",
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF6A1B9A),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),

                    // Subtitle
                    Text(
                      "Enter your email to receive a password reset link.",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),

                    // Email field (now a TextFormField with validator)
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: GoogleFonts.poppins(),
                        prefixIcon: const Icon(Icons.email_outlined),
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),

                    // Send button
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                title: Row(
                                  children: const [
                                    Icon(
                                      Icons.email_outlined,
                                      color: Colors.green,
                                      size: 28,
                                    ),
                                    SizedBox(width: 8),
                                    Text("Request Sent"),
                                  ],
                                ),
                                content: Text(
                                  "A reset link has been sent to your email.",
                                  style: GoogleFonts.poppins(fontSize: 16),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context); // close popup
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "OK",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF6A1B9A),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6A1B9A),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 6,
                      ),
                      child: Text(
                        "Send Request", // ✅ fixed button label
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Back to login
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Back to Login",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF6A1B9A),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
