import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/portfolio_controller.dart';

class MyPortfolioScreen extends StatefulWidget {
  const MyPortfolioScreen({super.key});

  @override
  State<MyPortfolioScreen> createState() => _MyPortfolioScreenState();
}

class _MyPortfolioScreenState extends State<MyPortfolioScreen> {
  final PortfolioController controller =
      Get.find<PortfolioController>();

  final TextEditingController symbolController =
      TextEditingController();

  /// ADD STOCK POPUP
  void _showAddStockDialog() {
    Get.defaultDialog(
      title: "Add Stock",
      content: TextField(
        controller: symbolController,
        textCapitalization: TextCapitalization.characters,
        decoration: const InputDecoration(
          hintText: "Enter symbol (AAPL)",
        ),
      ),
      textCancel: "Cancel",
      textConfirm: "Add",
      onConfirm: () {
        final symbol = symbolController.text.trim();
        if (symbol.isNotEmpty) {
          controller.addStock(symbol);
        }
        symbolController.clear();
        Get.back();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Portfolio"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showAddStockDialog,
          ),
        ],
      ),

      /// REACTIVE UI
      body: Obx(() {
        /// LOADING STATE
        if (controller.isLoading.value &&
            controller.portfolio.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        /// EMPTY STATE
        if (controller.portfolio.isEmpty) {
          return const Center(
            child: Text(
              "No stocks added yet\nTap + to add",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          );
        }

        /// PORTFOLIO LIST
        return RefreshIndicator(
          onRefresh: controller.refreshPortfolio,
          child: ListView.builder(
            itemCount: controller.portfolio.length,
            itemBuilder: (_, index) {
              final stock = controller.portfolio[index];
              final isPositive = controller
                  .isPositive(stock.percentChange);

              return Card(
                margin: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8),
                elevation: 3,
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),

                  /// SYMBOL
                  title: Text(
                    stock.symbol,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  subtitle: const Text("Last Close Price"),

                  /// PRICE + % CHANGE
                  trailing: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$${stock.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${stock.percentChange.toStringAsFixed(2)}%",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isPositive
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}