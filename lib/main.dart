import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_app/bloc/pagar/pagar_bloc.dart';
import 'package:stripe_app/pages/card_page.dart';
import 'package:stripe_app/pages/completed_payment_page.dart';
import 'package:stripe_app/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext _) => PagarBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stripe App',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'completed_payment': (_) => CompletePaymentPage()
        },
        theme: ThemeData.light().copyWith(
          primaryColor: Color(0xff284879),
          scaffoldBackgroundColor: Color(0xff21232A),
        ),
      ),
    );
  }
}
