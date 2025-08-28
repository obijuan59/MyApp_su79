import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPassword = true;
  bool isConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A1B9A), Color(0xFF8E24AA)], // Purple gradient
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
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icon
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: const Color(0xFF6A1B9A),
                      child: const Icon(
                        Icons.person_add_alt_1,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Title
                    Text(
                      "Create Account",
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF6A1B9A),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),

                    Text(
                      "Join us and explore all features",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),

                    // Email
                    TextFormField(
                      controller: emailController,
                      decoration: _inputDecoration("Email", Icons.email),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email is required!";
                        }
                        final regex = RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        );
                        if (!regex.hasMatch(value)) {
                          return "Enter a valid email!";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Phone
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: _inputDecoration("Phone Number", Icons.phone),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Phone number is required!";
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return "Phone number must be numeric!";
                        }
                        if (value.length < 8) {
                          return "Phone number must be at least 8 digits!";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Password
                    TextFormField(
                      controller: passwordController,
                      obscureText: isPassword,
                      decoration: _inputDecoration(
                        "Password",
                        Icons.lock,
                        suffix: IconButton(
                          icon: Icon(
                            isPassword
                                ? CupertinoIcons.eye_slash
                                : CupertinoIcons.eye,
                          ),
                          onPressed: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required!";
                        }
                        if (value.length < 6) {
                          return "Password must be at least 6 characters!";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Confirm Password
                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: isConfirmPassword,
                      decoration: _inputDecoration(
                        "Confirm Password",
                        Icons.lock_outline,
                        suffix: IconButton(
                          icon: Icon(
                            isConfirmPassword
                                ? CupertinoIcons.eye_slash
                                : CupertinoIcons.eye,
                          ),
                          onPressed: () {
                            setState(() {
                              isConfirmPassword = !isConfirmPassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please confirm your password!";
                        }
                        if (value != passwordController.text) {
                          return "Passwords do not match!";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),

                    // Sign Up Button
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            barrierDismissible:
                                false, // Prevent closing by tapping outside
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                title: Row(
                                  children: const [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 28,
                                    ),
                                    SizedBox(width: 8),
                                    Text("Success"),
                                  ],
                                ),
                                content: Text(
                                  "Registration successful!",
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
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Already have an account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Login",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF6A1B9A),
                            ),
                          ),
                        ),
                      ],
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

  // Custom Input Decoration for consistency
  InputDecoration _inputDecoration(
    String label,
    IconData icon, {
    Widget? suffix,
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.poppins(),
      prefixIcon: Icon(icon),
      suffixIcon: suffix,
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }
}
