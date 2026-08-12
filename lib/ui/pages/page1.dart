import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/responsive_widget.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: Scaffold(
        appBar: AppBar(
          key: const Key('page1AppBar'),
          title: const Text('Welcome to this app!'),
        ),
        body: Center(
          key: const Key('page1Body'),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                key: const Key('page1Column'),
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Please enter your name and press the button below to continue.',
                    key: Key('page1InstructionsText'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      key: const Key('page1NameField'),
                      textInputAction: TextInputAction.go,
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  ElevatedButton(
                      key: const Key('page1ContinueButton'),
                      onPressed: () => _formKey.currentState!.validate()
                          ? Get.offNamed("/page2/?name=${_controller.text}")
                          : null,
                      child: const Text('Continue'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
