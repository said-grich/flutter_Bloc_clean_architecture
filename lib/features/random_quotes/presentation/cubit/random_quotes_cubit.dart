import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quetos/core/error/failures.dart';
import 'package:quetos/core/usecases/usecase.dart';
import 'package:quetos/core/utils/app_strings.dart';
import 'package:quetos/features/random_quotes/domain/entities/quote.dart';
import 'package:quetos/features/random_quotes/domain/usecases/get_random_quote.dart';

part 'random_quotes_state.dart';

class RandomQuotesCubit extends Cubit<RandomQuotesState> {
  final GetRandomQuote getRandomQuoteUseCase;
  RandomQuotesCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuotesInitial());
  Future<void> getRandomQuote() async {
    emit(RandomQuotesIsLoading());
    Either<Failure, Quote> rs = await getRandomQuoteUseCase(NoParams());
    emit(rs.fold((failure) => RandomQuotesError(msg: _mapFailureToMsg(failure)),
        (quote) => RandomQuotesLoaded(quote: quote)));
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppString.serverFailure;
      case CacheFailure:
        return AppString.cacheFailure;

      default:
        return AppString.unexceptedError;
    }
  }
}
