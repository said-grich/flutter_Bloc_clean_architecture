import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quetos/core/network/network_info.dart';
import 'package:quetos/features/random_quotes/data/datasources/random_quote_locale.dart';
import 'package:quetos/features/random_quotes/data/datasources/random_quote_remote_data_source.dart';
import 'package:quetos/features/random_quotes/data/repositories/quote_Repository_imp.dart';
import 'package:quetos/features/random_quotes/domain/repositories/quote_repository.dart';
import 'package:quetos/features/random_quotes/domain/usecases/get_random_quote.dart';
import 'package:quetos/features/random_quotes/presentation/cubit/random_quotes_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
//! Feautures
//Blocs
  sl.registerFactory(() => RandomQuotesCubit(getRandomQuoteUseCase: sl()));
//Use caces :
  sl.registerLazySingleton(() => GetRandomQuote(quoteRepository: sl()));

//Repositories :
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImp(
      randomQuoteLocalDataSource: sl(),
      randomQuoteRemoteDataSource: sl(),
      networkInfo: sl()));
//Data source :
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
      () => RandomQuoteLocalDataSourceImp(sharedPreferences: sl()));
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
      () => RandomQuoteRemoteDataSourceImpl(client: sl()));
//! Core :
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(connectionChecker: sl()));

//! External :
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
