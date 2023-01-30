import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_mansour/cubit/statecubit.dart';
import 'package:weather_app_mansour/modules/busniss_screen.dart';
import 'package:weather_app_mansour/modules/tech_screen.dart';
import 'package:weather_app_mansour/modules/sport_screen.dart';
import 'package:weather_app_mansour/network/cache.dart';

import '../network/dio.dart';

class appcubit extends Cubit<newsstate> {
  appcubit() : super(newsinitial());
  static appcubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  List<BottomNavigationBarItem> navitem = [
    const BottomNavigationBarItem(icon: Icon(Icons.work), label: 'business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'sports'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.laptop_mac), label: 'technology'),
  ];
  void changeindex(int index) {
    currentindex = index;
    if (index == 1) {
      getsportss();
    }
    if (index == 2) {
      gettech();
    }
    emit(newsbottomchange());
  }

  List<Widget> screens = [
    busniss(),
    sports(),
    tech_screen(),
  ];
  List<dynamic>? bussnis = [];
  List<dynamic>? sportss = [];
  List<dynamic>? tech = [];
  void getbusniss() {
    emit(newsloadingbusnissstate());
    DioHelper.getdata(url: '/v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '44e23d5166b84c1a93c156048c942d42'
    }).then((value) {
      bussnis = value.data['articles'];
      emit(newsgetbusnisssuccesstate());
    }).catchError((error) {
      emit(newsgetbusnisserrorstate(error));
    });
  }

  void getsportss() {
    emit(newsloadingsports());
    DioHelper.getdata(url: '/v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '44e23d5166b84c1a93c156048c942d42'
    }).then((value) {
      sportss = value.data['articles'];
      emit(newsgetsuccessports());
    }).catchError((error) {
      emit(newsgeterrorsports(error));
    });
  }

  void gettech() {
    emit(newsgetloadingtech());
    DioHelper.getdata(url: '/v2/top-headlines', query: {
      'country': 'eg',
      'category': 'technology',
      'apiKey': '44e23d5166b84c1a93c156048c942d42'
    }).then((value) {
      tech = value.data['articles'];
      emit(newsgetsuccestech());
    }).catchError((error) {
      emit(newsgeterrortech(error));
    });
  }

  bool isdark = true;
  void changemode({bool? fromshared}) {
    if (fromshared != null) {
      isdark = fromshared;
    } else {
      isdark = !isdark;
      CacheHelper.putBoolean(key: 'isdark', value: isdark)
          .then((value) => emit(changemodestate()));
    }
  }

  List<dynamic>? search = [];

  getsearch(String value) {
    emit(newsgetloadingtsearch());
    DioHelper.getdata(url: '/v2/everything', query: {
      'q': '$value ',
      'apiKey': '44e23d5166b84c1a93c156048c942d42'
    }).then((value) {
      search = value.data['articles'];
      emit(newsgetsuccessearch());
    }).catchError((error) {
      emit(newsgeterrorsearch(error));
    });
  }
}
