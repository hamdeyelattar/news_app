import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/layout/cubit/news_cubit.dart';
import 'package:news_app/presentation/screens/search_screen/search_screen.dart';
import 'package:news_app/presentation/shared/components.dart';

class NewsLayout extends StatelessWidget {
  NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            //backgroundColor: Colors.purpleAccent,
            title: const Text(
              'News App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
                icon: Icon(
                  Icons.search_rounded,
                  size: 40,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              IconButton(
                onPressed: () {
                  NewsCubit.get(context).ChangeAppMode();
                },
                icon: const Icon(
                  Icons.brightness_4_outlined,
                  size: 40,
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 18),
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 25,
                top: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(80),
                ),
              ),
              child: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.ChangeBottomNavBar(index);
                },
                items: cubit.bottomItems,
              ),
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
