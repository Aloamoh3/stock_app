import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';
import 'package:stock_app/models/stock.dart';
import 'dart:async';

class DataController extends GetxController {
  Rx<AlphaVantageDailyResponse> appleStock =
      AlphaVantageDailyResponse.fromEmpty().obs;
  Rx<AlphaVantageDailyResponse> googleStock =
      AlphaVantageDailyResponse.fromEmpty().obs;
  Rx<AlphaVantageDailyResponse> amazonStock =
      AlphaVantageDailyResponse.fromEmpty().obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();

    getStockPrices();

    // 🔥 Auto refresh every 10 seconds
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      getStockPrices();
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  Future<void> getStockPrices() async {
    try {
      final results = await Future.wait([
        RemoteServices.getStockPrices("AAPL"),
        RemoteServices.getStockPrices("GOOGL"),
        RemoteServices.getStockPrices("AMZN"),
      ]);

      appleStock.value = results[0];
      googleStock.value = results[1];
      amazonStock.value = results[2];
    } catch (e) {
      print("Error fetching stocks: $e");
    }
  }
}

class RemoteServices {
  static final Dio dio = Dio(
    BaseOptions(baseUrl: "https://www.alphavantage.co"),
  );

  static Future<AlphaVantageDailyResponse> getStockPrices(String symbol) async {
    try {
      final response = await dio.get(
        "/query",
        queryParameters: {
          "function": "TIME_SERIES_DAILY",
          "symbol": symbol,
          "apikey": "VRPSSNJICLSJMM08",
        },
      );

      return AlphaVantageDailyResponse.fromJson(response.data);
    } catch (e) {
      throw Exception("API Error: $e");
    }
  }
}
