import '../models/stock.dart';

class Stock {
  final String symbol;
  final int quantity;
  final double price;
  final String type;

  Stock({
    required this.symbol,
    required this.quantity,
    required this.price,
    required this.type,
  });
  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      symbol: json['symbol'],
      quantity: json['quantity'],
      price: double.parse(json['price'].toString()),
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'quantity': quantity,
      'price': price,
      'type': type,
    };
  }
}
