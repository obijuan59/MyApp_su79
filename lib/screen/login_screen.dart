import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:MyApp/screen/main_screen.dart';
import 'package:MyApp/screen/signup_screen.dart';
import '../helper/pos_textform_field.dart';
import '../helper/style.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A1B9A), Color(0xFF8E24AA)], // Purple shades
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
                    // Logo / Icon
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: const Color(0xFF6A1B9A),
                      child: const Icon(
                        Icons.lock_outline,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Title
                    Text(
                      "Welcome Back!",
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF6A1B9A),
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      "Login to continue",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Email
                    PosTextformField(
                      controller: emailController,
                      label: "Email",
                      placeholder: "Enter your email",
                      prefixIcon: const Icon(Icons.email),
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

                    // Password
                    PosTextformField(
                      controller: passwordController,
                      label: "Password",
                      placeholder: "Enter your password",
                      obscureText: _isPassword,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPassword ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPassword = !_isPassword;
                          });
                        },
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

                    const SizedBox(height: 12),

                    // Forgot password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF6A1B9A),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Login button
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainScreen(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6A1B9A),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 6,
                      ),
                      child: Text(
                        "Login",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Social login divider
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "Or login with",
                            style: GoogleFonts.poppins(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const Expanded(child: Divider()),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Sign up
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign Up",
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

  // Custom social button widget
  Widget _socialButton(String assetPath) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 48,
        width: 48,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(assetPath),
      ),
    );
  }
}
