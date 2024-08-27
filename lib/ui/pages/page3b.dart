import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page3B extends StatelessWidget {
  Page3B({super.key});
  final String? name = Get.parameters['name'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name Option B'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                'This is a snackbar demo. Click the button below to see it in action.'),
            ElevatedButton(
                onPressed: () =>
                    Get.snackbar('Hi', 'This is a snackbar on Top'),
                child: const Text('Show Top Snackbar')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => Get.snackbar(
                    'Hi', 'This is a snackbar on Bottom',
                    snackPosition: SnackPosition.BOTTOM),
                child: const Text('Show Bottom Snackbar'))
          ],
        ),
      )),
    );
  }
}
