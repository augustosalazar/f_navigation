import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page2 extends StatelessWidget {
  Page2({super.key});
  final String? name = Get.parameters['name'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $name!'),
      ),
    );
  }
}
