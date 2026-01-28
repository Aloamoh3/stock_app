import 'dart:convert';
import 'dart:io';
import '../models/stock.dart';

class TransactionController {

  // REAL API endpoint used in class
  final String apiUrl = "https://github.com/blacktorch/stocks_app/blob/main/lib/widgets/transaction_button.dart";

  Future<bool> sendTransaction(Stock transaction) async {
    try {
      final uri = Uri.parse(apiUrl);
      final client = HttpClient();

      final request = await client.postUrl(uri);
      request.headers.set('Content-Type', 'application/json');

      request.add(utf8.encode(jsonEncode(transaction.toJson())));

      final response = await request.close();

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Transaction successful!");
        return true;
      } else {
        print("Transaction failed!");
        return false;
      }
    } catch (e) {
      print("API Error: $e");
      return false;
    }
  }
}
