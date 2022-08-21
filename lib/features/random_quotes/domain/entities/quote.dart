import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String author;
  final String quote;
  final String permalink;
  final int id;

  const Quote({required this.author,required this.quote,required this.permalink,required this.id});

  @override
  List<Object?> get props =>[author , quote ,permalink, id];
}
