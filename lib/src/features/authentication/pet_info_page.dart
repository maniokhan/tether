import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PetInformationScreen extends ConsumerStatefulWidget {
  const PetInformationScreen({super.key});
  static Route<PetInformationScreen> route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => const PetInformationScreen(),
    );
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PetInformationScreenState();
}

class _PetInformationScreenState extends ConsumerState<PetInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              'assets/primary_logo.jpeg',
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Pet Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Pet Age',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Breed',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Medical Condition',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.blueAccent,
                fixedSize: const Size(120, 50),
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: const Text("Let's Start"),
            ),
          ],
        ),
      ),
    );
  }
}
