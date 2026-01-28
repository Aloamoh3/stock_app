import '../models/stock.dart';

class StockTransaction {
  final String symbol;
  final int quantity;
  final double price;
  final String type;

  StockTransaction({
    required this.symbol,
    required this.quantity,
    required this.price,
    required this.type,
  });

  factory StockTransaction.fromJson(Map<String, dynamic> json) {
    return StockTransaction(
      symbol: json['symbol'],
      quantity: json['quantity'],
      price: double.parse(json['price'].toString()),
      type: json['type'],
    );
  }

  // Dart → JSON
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'quantity': quantity,
      'price': price,
      'type': type,
    };
  }
}
