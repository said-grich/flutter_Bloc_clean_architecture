import 'dart:convert';

import 'package:quetos/core/error/exceptions.dart';
import 'package:quetos/core/utils/app_strings.dart';
import 'package:quetos/features/random_quotes/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getLastRandomQuote();
  Future<void> cacheQuote(QuoteModel quote);
}

class RandomQuoteLocalDataSourceImp implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSourceImp({required this.sharedPreferences});

  @override
  Future<QuoteModel> getLastRandomQuote() {
    final jsonString = sharedPreferences.getString(AppString.cacheRandomQuote);
    if (jsonString != null) {
      final cachRandomQuote =
          Future.value(QuoteModel.fromJson(json.decode(jsonString)));
      return cachRandomQuote;
    } else {
      throw CachException();
    }
  }

  @override
  Future<bool> cacheQuote(QuoteModel quote) async {
    return sharedPreferences.setString(
        AppString.cacheRandomQuote, json.encode(quote));
  }
}
