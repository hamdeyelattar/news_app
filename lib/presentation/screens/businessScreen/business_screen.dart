import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/layout/cubit/news_cubit.dart';
import 'package:news_app/presentation/shared/components.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list   = NewsCubit.get(context).business;

        return articleBuilder(list,context);
      },
    );
  }
}
