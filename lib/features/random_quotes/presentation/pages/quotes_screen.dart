import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quetos/core/utils/app_colors.dart';
import 'package:quetos/core/utils/app_strings.dart';
import 'package:quetos/core/widgets/error_widget.dart' as error;

import 'package:quetos/features/random_quotes/presentation/cubit/random_quotes_cubit.dart';

import '../widgets/quote_content.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreen();
}

class _QuoteScreen extends State<QuoteScreen> {
  _getRandomQote() =>
      BlocProvider.of<RandomQuotesCubit>(context).getRandomQuote();

  @override
  void initState() {
    super.initState();
    _getRandomQote();
  }

  Widget _buildBodyContent() {
    return BlocBuilder<RandomQuotesCubit, RandomQuotesState>(
        builder: (contex, state) {
      if (state is RandomQuotesIsLoading) {
        return Center(
          child: SpinKitFadingCircle(
            color: AppColors.primaryColor,
          ),
        );
      } else if (state is RandomQuotesError) {
        return const error.ErrorWidget();
        
      } else if (state is RandomQuotesLoaded) {
        return Column(
          children: [
            QuoteContent(quote: state.quote),
            InkWell(
              onTap: (()=>_getRandomQote()),
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.primaryColor),
                child: const Icon(
                  Icons.refresh,
                  size: 29,
                  color: Colors.white,
                ),
              ),
            )
          ],
        );
      } else {
        return const Center(
          child: Text("Unecepted Error"),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text(AppString.appName),
    );
     return RefreshIndicator(child: Scaffold(appBar: appBar, body: _buildBodyContent()),onRefresh: ()=>_getRandomQote(),);
  }
}
