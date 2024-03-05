import 'package:flutter/material.dart';
import 'package:my_util_widget/screens/button_screen.dart';
import 'package:my_util_widget/screens/form_screen.dart';
import 'package:my_util_widget/screens/text_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  openScreen(context: context, screen: const ButtonScreen());
                },
                child: const Text('Button')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  openScreen(context: context, screen: const FormScreen());
                },
                child: const Text('Form')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  openScreen(context: context, screen: const TextScreen());
                },
                child: const Text('Text')),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void openScreen({
    required BuildContext context,
    required Widget screen,
  }) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }
}
