import 'package:dartz/dartz.dart';
import 'package:quetos/core/error/failures.dart';
import 'package:quetos/core/usecases/usecase.dart';
import 'package:quetos/features/random_quotes/domain/entities/quote.dart';
import 'package:quetos/features/random_quotes/domain/repositories/quote_repository.dart';

class GetRandomQuote implements UseCase<Quote, NoParams> {
  final QuoteRepository quoteRepository;

  GetRandomQuote({required this.quoteRepository});

  @override
  Future<Either<Failure, Quote>> call(NoParams params) {
    return quoteRepository.getRandomQuote();
  }
}
