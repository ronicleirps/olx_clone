import 'package:flutter/material.dart';
import 'package:olx_clone/RouterGenerator.dart';
import 'package:olx_clone/view/anuncios.dart';
import 'package:olx_clone/view/login.dart';

final ThemeData temaPadrao = ThemeData(
    primaryColor: const Color(0xff9c27b0),
    colorScheme: ColorScheme.fromSwatch()
            .copyWith(
                        primary: const Color(0xff7b1fa2),

              secondary:const Color(0xff7b1fa2)),
              buttonTheme:const ButtonThemeData(
          buttonColor:  Color(0xff7b1fa2),
          textTheme: ButtonTextTheme.primary,
          
        ),
    );
    

void main() => runApp( MaterialApp(
      title: "OLX",
      home: const Anuncios(),
      theme: temaPadrao,
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    ));
