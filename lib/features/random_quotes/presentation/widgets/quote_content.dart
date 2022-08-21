import 'package:flutter/material.dart';
import 'package:quetos/core/utils/app_colors.dart';
import 'package:quetos/features/random_quotes/domain/entities/quote.dart';

class QuoteContent extends StatelessWidget {
  const QuoteContent({Key? key, required this.quote}) : super(key: key);
  final Quote quote;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.primaryColor),
      child: Column(
        children: [
          Text(
            quote.quote,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Text(
             quote.author,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )
        ],
      ),
    );
  }
}
