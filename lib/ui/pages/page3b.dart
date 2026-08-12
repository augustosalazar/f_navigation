import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/responsive_widget.dart';

class Page3B extends StatelessWidget {
  Page3B({super.key});
  final String? name = Get.parameters['name'];
  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: Scaffold(
        appBar: AppBar(
          key: const Key('page3BAppBar'),
          title: Text(
            '$name Option B',
            key: const Key('page3BAppBarTitle'),
          ),
        ),
        body: Center(
            key: const Key('page3BBody'),
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            key: const Key('page3BColumn'),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'This is a snackbar demo. Click the button below to see it in action.',
                key: Key('page3BDescriptionText'),
              ),
              ElevatedButton(
                  key: const Key('page3BTopSnackbarButton'),
                  onPressed: () =>
                      Get.snackbar('Hi', 'This is a snackbar on Top'),
                  child: const Text('Show Top Snackbar')),
              const SizedBox(height: 20),
              ElevatedButton(
                  key: const Key('page3BBottomSnackbarButton'),
                  onPressed: () => Get.snackbar(
                      'Hi', 'This is a snackbar on Bottom',
                      snackPosition: SnackPosition.BOTTOM),
                  child: const Text('Show Bottom Snackbar'))
            ],
          ),
        )),
      ),
    );
  }
}
