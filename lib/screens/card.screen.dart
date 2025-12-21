import 'package:flutter/material.dart';
import '../widgets/action.button.dart';
import '../widgets/investement.card.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cards'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [

            SizedBox(height: 24),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(
                  icon: Icons.add,
                  label: 'Add Card',
                ),
                ActionButton(
                  icon: Icons.lock,
                  label: 'Freeze',
                ),
                ActionButton(
                  icon: Icons.settings,
                  label: 'Settings',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

