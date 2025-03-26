import 'package:flutter/material.dart';

class MyTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText; // Default false for normal text fields

  const MyTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false, // Default value
  });

  @override
  _MyTextfieldState createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  bool _isObscured = true; // To toggle password visibility

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText; // Set initial state based on obscureText
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: widget.controller,
        obscureText: _isObscured, // Toggles text visibility
        decoration: InputDecoration(
          filled: true,
          fillColor: isDarkMode ? Colors.white12 : Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: isDarkMode ? Colors.white : Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: isDarkMode ? Colors.blue : Colors.blueAccent),
          ),
          hintText: widget.hintText,
          hintStyle:
              TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54),
          suffixIcon: widget.obscureText // Show eye icon only for passwords
              ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility_off : Icons.visibility,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured; // Toggle visibility
                    });
                  },
                )
              : null,
        ),
        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
      ),
    );
  }
}
