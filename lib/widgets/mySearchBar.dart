import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  final String hintText;
  final Function(String) onSearch;

  const MySearchBar({
    Key? key,
    this.hintText = "",
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
      ),
      onChanged: onSearch,
    );
  }
}
