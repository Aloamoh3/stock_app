class StockPoint {
  final DateTime time;
  final double price;

  StockPoint({required this.time, required this.price});

  factory StockPoint.fromJson(Map<String, dynamic> json) {
    return StockPoint(
      time: DateTime.parse(json['time']),
      price: json['price'].toDouble(),
    );
  }
}
