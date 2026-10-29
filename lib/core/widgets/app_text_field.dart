import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    required this.label,
    super.key,
    this.isPassword = false,
    this.obscureText = false,
    this.showVisibilityToggle = true,
    this.helperText,
    this.helperStyle,
    this.initialValue,
    this.keyboardType,
  });

  final String label;
  final bool isPassword;
  final bool obscureText;
  final bool showVisibilityToggle;
  final String? helperText;
  final TextStyle? helperStyle;
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
      obscureText: widget.obscureText || (widget.isPassword && _obscureText),
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        labelText: widget.label,
        helperText: widget.helperText,
        helperStyle: widget.helperStyle,
        suffixIcon: widget.isPassword && widget.showVisibilityToggle
            ? IconButton(
                tooltip: _obscureText ? 'Показати пароль' : 'Сховати пароль',
                onPressed: () => setState(() => _obscureText = !_obscureText),
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              )
            : null,
      ),
    );
  }
}
