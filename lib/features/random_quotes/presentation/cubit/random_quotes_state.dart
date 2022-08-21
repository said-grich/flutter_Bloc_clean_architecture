part of 'random_quotes_cubit.dart';

abstract class RandomQuotesState extends Equatable {
  const RandomQuotesState();

  @override
  List<Object> get props => [];
}

class RandomQuotesInitial extends RandomQuotesState {}

class RandomQuotesIsLoading extends RandomQuotesState {}

class RandomQuotesLoaded extends RandomQuotesState {
  final Quote quote;

  const RandomQuotesLoaded({required this.quote});
  @override
  List<Object> get props => [quote];
}

class RandomQuotesError extends RandomQuotesState {
  final String msg;

  const RandomQuotesError({required this.msg});
  @override
  List<Object> get props => [msg];
}
