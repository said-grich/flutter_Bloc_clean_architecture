import 'package:dartz/dartz.dart';
import 'package:quetos/core/error/failures.dart';

import '../entities/quote.dart';

abstract class QuoteRepository {
  Future<Either<Failure, Quote>> getRandomQuote();
}
