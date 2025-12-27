import 'dart:convert';

ExchangeRateResponse exchangeRateResponseFromJson(String str) =>
    ExchangeRateResponse.fromJson(json.decode(str));

String exchangeRateResponseToJson(ExchangeRateResponse data) =>
    json.encode(data.toJson());

class ExchangeRateResponse {
  final RealtimeCurrencyExchangeRate realtimeCurrencyExchangeRate;

  ExchangeRateResponse({
    required this.realtimeCurrencyExchangeRate,
  });

  ExchangeRateResponse.fromJson(Map<String, dynamic> json)
      : realtimeCurrencyExchangeRate =
            RealtimeCurrencyExchangeRate.fromJson(
          json['Realtime Currency Exchange Rate'],
        );

  Map<String, dynamic> toJson() {
    return {
      'Realtime Currency Exchange Rate':
          realtimeCurrencyExchangeRate.toJson(),
    };
  }
}

class RealtimeCurrencyExchangeRate {
  final String fromCurrencyCode;
  final String fromCurrencyName;
  final String toCurrencyCode;
  final String toCurrencyName;
  final String exchangeRate;
  final String lastRefreshed;
  final String timeZone;
  final String bidPrice;
  final String askPrice;

  RealtimeCurrencyExchangeRate({
    required this.fromCurrencyCode,
    required this.fromCurrencyName,
    required this.toCurrencyCode,
    required this.toCurrencyName,
    required this.exchangeRate,
    required this.lastRefreshed,
    required this.timeZone,
    required this.bidPrice,
    required this.askPrice,
  });

  RealtimeCurrencyExchangeRate.fromJson(Map<String, dynamic> json)
      : fromCurrencyCode = json['1. From_Currency Code'],
        fromCurrencyName = json['2. From_Currency Name'],
        toCurrencyCode = json['3. To_Currency Code'],
        toCurrencyName = json['4. To_Currency Name'],
        exchangeRate = json['5. Exchange Rate'],
        lastRefreshed = json['6. Last Refreshed'],
        timeZone = json['7. Time Zone'],
        bidPrice = json['8. Bid Price'],
        askPrice = json['9. Ask Price'];

  Map<String, dynamic> toJson() {
    return {
      '1. From_Currency Code': fromCurrencyCode,
      '2. From_Currency Name': fromCurrencyName,
      '3. To_Currency Code': toCurrencyCode,
      '4. To_Currency Name': toCurrencyName,
      '5. Exchange Rate': exchangeRate,
      '6. Last Refreshed': lastRefreshed,
      '7. Time Zone': timeZone,
      '8. Bid Price': bidPrice,
      '9. Ask Price': askPrice,
    };
  }
}
