import 'package:flutter/material.dart';
import '/widgets/action.button.dart';
import '/widgets/investement.card.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Total balance",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              "\$24,109.10",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                ActionButton(icon: Icons.arrow_upward, label: "Send"),
                ActionButton(icon: Icons.arrow_downward, label: "Receive"),
                ActionButton(icon: Icons.swap_horiz, label: "Swap"),
              ],
            ),

            const SizedBox(height: 32),

            const Text(
              "Featured investment",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  InvestmentCard(
                    name: "Apple",
                    symbol: "AAPL",
                    color: Colors.blue,
                  ),
                  InvestmentCard(
                    name: "Google",
                    symbol: "GOOGL",
                    color: Colors.red,
                  ),
                  InvestmentCard(
                    name: "Amazon",
                    symbol: "AMZN",
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
