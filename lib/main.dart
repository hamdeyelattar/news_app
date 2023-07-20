import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/data/sources/cache_helper.dart';
import 'package:news_app/data/sources/dio_helper.dart';
import 'package:news_app/presentation/layout/cubit/news_cubit.dart';
import 'package:news_app/presentation/layout/news_layout.dart';
import 'package:news_app/presentation/shared/bloc_observer.dart';

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
              theme: ThemeData(
                primarySwatch: Colors.purple,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                    backgroundColor: Colors.purpleAccent),
                scaffoldBackgroundColor: Colors.white,

                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  iconTheme: IconThemeData(color: Colors.purple),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarBrightness: Brightness.dark,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                ),
                //useMaterial3: true,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  selectedItemColor: Colors.purple,
                  unselectedItemColor: Colors.black,
                  type: BottomNavigationBarType.fixed,
                ),
                textTheme: TextTheme(
                  bodyLarge: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              darkTheme: ThemeData(
                primarySwatch: Colors.purple,
                scaffoldBackgroundColor: HexColor('333739'),
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                    backgroundColor: Colors.grey),
                appBarTheme: AppBarTheme(
                  backgroundColor: HexColor('333739'),
                  elevation: 20,
                  titleTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 0.0,
                      fontWeight: FontWeight.bold),
                  iconTheme: const IconThemeData(color: Colors.white),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('333739'),
                    statusBarBrightness: Brightness.light,

                    // statusBarIconBrightness: Brightness.dark
                  ),
                ),
                //useMaterial3: true,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.purple,
                  unselectedItemColor: Colors.grey,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: HexColor('333736'),
                ),
                textTheme: TextTheme(
                  bodyLarge: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
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
