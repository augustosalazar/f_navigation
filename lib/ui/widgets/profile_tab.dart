import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key, this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Center(
      key: const Key('profileTabRoot'),
      child: Column(
        key: const Key('profileTabColumn'),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            key: Key('profileTabAvatar'),
            radius: 36,
            child: Icon(Icons.person, size: 36),
          ),
          const SizedBox(height: 16),
          Text(
            name == null || name!.isEmpty ? 'Guest user' : name!,
            key: const Key('profileTabNameText'),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          const Text(
            'This is your profile page.',
            key: Key('profileTabDescriptionText'),
          ),
        ],
      ),
    );
  }
}
