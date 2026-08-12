import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key, this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    final currentName = name ?? Get.parameters['name'];

    return Center(
      key: const Key('homeTabRoot'),
      child: Column(
        key: const Key('homeTabColumn'),
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have successfully navigated to this page.',
            key: Key('homeTabMessageText'),
          ),
          const SizedBox(height: 20),
          const Text(
            'Do you want option A or B?',
            key: Key('homeTabPromptText'),
          ),
          const SizedBox(height: 20),
          Row(
            key: const Key('homeTabActionsRow'),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                key: const Key('homeTabOptionAButton'),
                onPressed: () => Get.toNamed('/page3a/?name=$currentName'),
                child: const Text('Option A'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                key: const Key('homeTabOptionBButton'),
                onPressed: () => Get.toNamed('/page3b/?name=$currentName'),
                child: const Text('Option B'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
