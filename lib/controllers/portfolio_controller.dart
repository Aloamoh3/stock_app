import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PortfolioStock {
  final String symbol;
  double price;
  double percentChange;

  PortfolioStock({
    required this.symbol,
    this.price = 0,
    this.percentChange = 0,
  });
}

class PortfolioController extends GetxController {
  var portfolio = <PortfolioStock>[].obs;
  var isLoading = false.obs;

  final String apiKey = "YOUR_API_KEY";
  final String apiSecret = "YOUR_API_SECRET";
  final String baseUrl = "https://data.alpaca.markets/v2/stocks";

  void addStock(String symbol) {
    portfolio.add(PortfolioStock(symbol: symbol));
    fetchStockData(symbol);
  }

  Future<void> fetchStockData(String symbol) async {
    isLoading.value = true;
    final url = Uri.parse("$baseUrl/$symbol/bars?timeframe=1Day&limit=1");

    try {
      final client = HttpClient();
      final request = await client.getUrl(url);

      // Add headers
      request.headers.set("APCA-API-KEY-ID", apiKey);
      request.headers.set("APCA-API-SECRET-KEY", apiSecret);

      final response = await request.close();
      final responseBody = await response.transform(utf8.decoder).join();

      if (response.statusCode == 200) {
        final data = json.decode(responseBody);

        if (data["bars"] != null && data["bars"].isNotEmpty) {
          final bar = data["bars"][0];
          double open = (bar["o"] ?? 0).toDouble();
          double close = (bar["c"] ?? 0).toDouble();
          double percentChange = ((close - open) / open) * 100;

          final stock = portfolio.firstWhere((s) => s.symbol == symbol);
          stock.price = close;
          stock.percentChange = percentChange;

          portfolio.refresh();
        }
      } else {
        debugPrint("Failed to fetch $symbol: ${response.statusCode}");
      }

      client.close();
    } catch (e) {
      debugPrint("Error fetching $symbol: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshPortfolio() async {
    for (var stock in portfolio) {
      await fetchStockData(stock.symbol);
    }
  }

  bool isPositive(double percent) => percent >= 0;
}