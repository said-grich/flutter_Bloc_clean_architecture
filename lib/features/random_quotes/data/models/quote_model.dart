import 'package:quetos/features/random_quotes/domain/entities/quote.dart';

class QuoteModel extends Quote {
  const  QuoteModel(
      {required String author,
      required String quote,
      required String permalink,
      required int id}) : super( author:  author, id: id, quote:  quote, permalink: permalink);

 factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
    author: json['author'],
    id : json['id'],
    quote : json['quote'],
    permalink : json['permalink'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'] = author;
    data['id'] = id;
    data['quote'] = quote;
    data['permalink'] = permalink;
    return data;
  }
}
