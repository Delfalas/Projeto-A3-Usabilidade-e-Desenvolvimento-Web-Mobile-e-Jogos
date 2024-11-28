import 'package:flutter/material.dart';

class Message {
  final BuildContext context;

  Message._(this.context);

  factory Message.of(BuildContext context) {
    return Message._(context);
  }

  void showInfo(String message) =>
      _showMessage(message, Theme.of(context).primaryColor);

  void showError(String message) => _showMessage(message, Colors.red);

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
