import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/sources/cache_helper.dart';
import 'package:news_app/data/sources/dio_helper.dart';
import 'package:news_app/presentation/layout/cubit/news_cubit.dart';
import 'package:news_app/presentation/layout/news_layout.dart';
import 'package:news_app/presentation/shared/bloc_observer.dart';
import 'package:news_app/presentation/shared/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getBoolean(
    key: 'isDark',
  );
  runApp(NewsApp(isDark));
}

class NewsApp extends StatelessWidget {
  final bool isDark;
  NewsApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBuiness()
            ..getSports()
            ..getScience(),
        ),
        BlocProvider(
          create: (context) => NewsCubit()..ChangeAppMode(fromShared: isDark),
        )
      ],
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: NewsCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: Directionality(
                textDirection: TextDirection.ltr,
                child: NewsLayout(),
              ));
        },
      ),
    );
  }
}
