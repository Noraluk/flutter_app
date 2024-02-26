import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_app/controllers/random_number_controller.dart';

class RandomNumberPage extends StatelessWidget {
  RandomNumberPage({super.key});

  static const String route = '/random_number';

  final RandomNumberController randomNumberController =
      RandomNumberController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => randomNumberController.random(),
      child: Scaffold(
        body: Container(
          color: Colors.blue[200],
          child: Center(
            child: Obx(
              () => Text(
                randomNumberController.number.toString(),
                style: const TextStyle(
                  fontSize: 100,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
