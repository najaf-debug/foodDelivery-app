// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:grocery_app/components/my_button.dart';
import 'package:grocery_app/components/my_textfield.dart';
import 'package:grocery_app/services/auth/auth_services.dart';

class LoginPage extends StatefulWidget {
  final void Function()? ontap;
  const LoginPage({super.key, required this.ontap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Login method
  void login() async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  // Forgot Password Dialog
  void forgotPw() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.surface,
              title: Text("User Tapped forgot password"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Icon(
                Icons.lock_open_rounded,
                size: 100,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              const SizedBox(height: 25),

              // App Title
              Text("Food Delivery App",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black)),

              const SizedBox(height: 15),

              // Email TextField
              MyTextfield(
                controller: emailController,
                hintText: "Enter Your Email",
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // Password TextField with Eye Icon
              MyTextfield(
                controller: passwordController,
                hintText: "Enter Your Password",
                obscureText: true, // Eye button should work now
              ),

              const SizedBox(height: 10),

              // Forgot Password Button
              GestureDetector(
                onTap: forgotPw,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Login Button
              MyButton(
                text: "Login",
                onTap: login,
              ),

              const SizedBox(height: 25),

              // Not a Member? Register Now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a Member?",
                      style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black)),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.ontap,
                    child: Text("Register now",
                        style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
