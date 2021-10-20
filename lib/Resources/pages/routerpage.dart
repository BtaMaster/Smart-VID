import 'package:flutter/material.dart';
class RouterPage extends StatelessWidget {
  const RouterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Center(
            child: Image(image: AssetImage("assets/images/logo.jpg"))
            ),
        color: Theme.of(context).colorScheme.primary,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width);
  }
}