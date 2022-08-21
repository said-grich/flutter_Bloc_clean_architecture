import 'dart:convert';

import 'package:quetos/core/api/end_points.dart';
import 'package:quetos/core/error/exceptions.dart';
import 'package:quetos/core/utils/app_strings.dart';
import 'package:quetos/features/random_quotes/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomeQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  http.Client client;

  RandomQuoteRemoteDataSourceImpl({required this.client});
  @override
  Future<QuoteModel> getRandomeQuote() async {
    final randomQuoteUri = Uri.parse(Endpoints.randomeQuote);
    final response = await client.get(randomQuoteUri,
        headers: {AppString.contentType: AppString.application});
    if (response.statusCode == 200) {
      return QuoteModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
