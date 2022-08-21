import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quetos/features/favorite/presentation/pages/favorite_quotes_scree.dart';
import 'package:quetos/features/random_quotes/presentation/cubit/random_quotes_cubit.dart';
import 'package:quetos/features/random_quotes/presentation/pages/quotes_screen.dart';
import 'package:quetos/injection_container.dart' as di;

class AppRoutes {
  static String initialRoute = "/";
  static String favouriteRoute = "/favourite";
}

final routes = {
//  AppRoutes.initialRoute: (context) => BlocProvider(create: ((context) => RandomQuotesCubit(getRandomQuoteUseCase: null)),child: const  QuoteScreen(),),
  AppRoutes.initialRoute: (context) => BlocProvider(create: (context)=> di.sl<RandomQuotesCubit>() ,child: const QuoteScreen(),) ,
  AppRoutes.favouriteRoute: (context) => const FavoriteQuotesSreene()
};
