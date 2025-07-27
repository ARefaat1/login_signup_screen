import 'package:flutter/material.dart';


class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isDisabled;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 16),
          backgroundColor: isDisabled ? Colors.grey : Theme.of(context).primaryColor,
        ),
        child: Text(label),
      ),
    );
  }
}
