import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    required this.label,
    super.key,
    this.isPassword = false,
    this.helperText,
    this.initialValue,
    this.keyboardType,
  });

  final String label;
  final bool isPassword;
  final String? helperText;
  final String? initialValue;
  final TextInputType? keyboardType;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      obscureText: widget.isPassword && _obscureText,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        labelText: widget.label,
        helperText: widget.helperText,
        suffixIcon: widget.isPassword
            ? IconButton(
                tooltip: _obscureText ? 'Показати пароль' : 'Сховати пароль',
                onPressed: () => setState(() => _obscureText = !_obscureText),
                icon: Icon(
                  _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                ),
              )
            : null,
      ),
    );
  }
}