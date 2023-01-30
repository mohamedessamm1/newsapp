import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_mansour/cubit/appcubit.dart';
import 'package:weather_app_mansour/cubit/statecubit.dart';
import 'package:weather_app_mansour/shared/componants/componants.dart';

class search extends StatelessWidget {
  TextEditingController searchcontrol = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit, newsstate>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = appcubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            title: const Text('akhbary', style: TextStyle(fontSize: 25)),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 15,),
               Padding(
                 padding: const EdgeInsets.only(left: 24),
                 child: Text('Search everything you want here : ',style: TextStyle(color: Colors.grey),),
               ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {
                    appcubit.get(context).getsearch(value);
                  },
                  controller: searchcontrol,
                  decoration: InputDecoration(
                      focusColor: Colors.teal,
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      hintText: 'search',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Expanded(child: buildelement(list, context, isearch: true))
            ],
          ),
        );
      },
    );
  }
}
