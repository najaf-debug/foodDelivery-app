import 'package:flutter/material.dart';
import 'package:grocery_app/components/my_button.dart';
import 'package:grocery_app/components/my_textfield.dart';
import 'package:grocery_app/services/auth/auth_services.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? ontap;
  const RegisterPage({super.key, required this.ontap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  // Register method
  void register() async {
    final authService = AuthService();

    if (passwordController.text == confirmpasswordController.text) {
      try {
        await authService.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Passwords don't match!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_open_rounded,
                  size: 100,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                const SizedBox(height: 25),
                Text("Let's create an account for you",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black)),
                const SizedBox(height: 15),
                MyTextfield(
                    controller: emailController,
                    hintText: "Enter Your Email",
                    obscureText: false),
                const SizedBox(height: 10),
                MyTextfield(
                    controller: passwordController,
                    hintText: "Enter Your Password",
                    obscureText: true),
                const SizedBox(height: 10),
                MyTextfield(
                    controller: confirmpasswordController,
                    hintText: "Confirm Your Password",
                    obscureText: true),
                const SizedBox(height: 10),
                MyButton(
                  text: "Sign Up",
                  onTap: register,
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                        style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black)),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.ontap,
                      child: Text("Login now",
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
      ),
    );
  }
}
