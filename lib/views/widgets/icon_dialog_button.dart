import 'package:flutter/material.dart';

class IconDialogButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final IconData iconData;

  const IconDialogButton({
    super.key,
    this.onPressed,
    this.text,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData),
          if (text != null) Text(text!),
        ],
      ),
    );
  }
}
