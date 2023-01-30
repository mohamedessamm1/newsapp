import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_mansour/cubit/appcubit.dart';
import 'package:weather_app_mansour/modules/web_view.dart';

Widget buildarticitem(art, context) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => webview_screen(art['url'])));
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(art['title'].toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            textDirection: TextDirection.rtl,
                            style: Theme.of(context).textTheme.bodyText1)),
                    Text(art['publishedAt'].toString(),
                        style: TextStyle(
                            fontSize: 13, color: Colors.grey.shade800)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              width: 135,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(art['urlToImage'].toString()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
Widget buildelement(list, context, {bool isearch = false}) => ConditionalBuilder(
    condition: list!.length > 0,
    builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildarticitem(list[index], context),
        separatorBuilder: (context, index) => mydivider(),
        itemCount: appcubit.get(context).bussnis!.length),
    fallback: (context) =>
        isearch ? Container() : Center(child: CircularProgressIndicator()));


Widget mydivider() => Container(
  color: Colors.grey.shade800,
  height: 1,
);
