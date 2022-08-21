// ignore: file_names
import 'package:quetos/core/error/exceptions.dart';
import 'package:quetos/core/network/network_info.dart';
import 'package:quetos/features/random_quotes/data/datasources/random_quote_locale.dart';
import 'package:quetos/features/random_quotes/data/datasources/random_quote_remote_data_source.dart';
import 'package:quetos/features/random_quotes/domain/entities/quote.dart';

import 'package:quetos/core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/quote_repository.dart';

class QuoteRepositoryImp implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;

  QuoteRepositoryImp(
      {required this.networkInfo,
      required this.randomQuoteRemoteDataSource,
      required this.randomQuoteLocalDataSource});
  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRandomeQuote =
            await randomQuoteRemoteDataSource.getRandomeQuote();
        randomQuoteLocalDataSource.cacheQuote(remoteRandomeQuote);
        return Right(remoteRandomeQuote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cachRandomeQuote =
            await randomQuoteLocalDataSource.getLastRandomQuote();
        return Right(cachRandomeQuote);
      } on CachException {
        return Left(CacheFailure());
      }
    }
  }
}
