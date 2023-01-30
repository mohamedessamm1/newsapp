import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_mansour/cubit/appcubit.dart';
import 'package:weather_app_mansour/cubit/statecubit.dart';
import 'package:weather_app_mansour/shared/componants/componants.dart';

class sports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit, newsstate>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = appcubit.get(context).sportss;
        return buildelement(list, context);
      },
    );
  }
}
