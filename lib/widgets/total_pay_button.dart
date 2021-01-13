import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stripe_app/bloc/pagar/pagar_bloc.dart';

class TotalPayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Total',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('250.55 USD',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
              ]),
          BlocBuilder<PagarBloc, PagarState>(
            builder: (context, state) {
              return _ButtonPay(state);
            },
          )
        ],
      ),
    );
  }
}

class _ButtonPay extends StatelessWidget {
  final state;

  const _ButtonPay(this.state);
  @override
  Widget build(BuildContext context) {
    return state.activedCard
        ? buildCardButton(context)
        : buildAppleGooglePay(context);
  }

  Widget buildCardButton(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      height: 45,
      minWidth: 150,
      shape: StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      child: Row(
        children: <Widget>[
          Icon(FontAwesomeIcons.solidCreditCard, color: Colors.white),
          SizedBox(width: 10),
          Text('Pay', style: TextStyle(color: Colors.white, fontSize: 22))
        ],
      ),
    );
  }

  Widget buildAppleGooglePay(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      height: 45,
      minWidth: 170,
      shape: StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      child: Row(
        children: <Widget>[
          Icon(
              Platform.isAndroid
                  ? FontAwesomeIcons.google
                  : FontAwesomeIcons.apple,
              color: Colors.white),
          SizedBox(width: 5),
          Text('Pay', style: TextStyle(color: Colors.white, fontSize: 22))
        ],
      ),
    );
  }
}
