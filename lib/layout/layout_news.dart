import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_mansour/cubit/appcubit.dart';
import 'package:weather_app_mansour/cubit/statecubit.dart';
import 'package:weather_app_mansour/modules/search.dart';

class layoutnews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit, newsstate>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = appcubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('akhbary', style: TextStyle(fontSize: 25)),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => search()));
                },
                icon: const Icon(Icons.search),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: IconButton(
                  onPressed: () {
                    cubit.changemode();
                  },
                  icon: const Icon(Icons.brightness_6_outlined),
                ),
              )
            ],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentindex,
            items: cubit.navitem,
            onTap: (index) {
              cubit.changeindex(index);
            },
          ),
          body: cubit.screens[cubit.currentindex],
        );
      },
    );
  }
}
