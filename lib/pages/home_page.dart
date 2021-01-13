import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/bloc/pagar/pagar_bloc.dart';
import 'package:stripe_app/data/cards.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/pages/card_page.dart';
import 'package:stripe_app/widgets/total_pay_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pagar'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              // mostrarLoading(context);
              // await Future.delayed(Duration(seconds: 1));
              // Navigator.pop(context);
              mostrarAlerta(context, 'Hola', 'Mundo');
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            width: size.width,
            height: size.height,
            top: 200,
            child: PageView.builder(
              controller: PageController(
                viewportFraction: 0.88,
              ),
              itemCount: cards.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (_, int index) {
                final card = cards[index];
                return GestureDetector(
                  onTap: () {
                    context.read<PagarBloc>().add(OnSelectCard(card));
                    Navigator.push(context,
                        navegarFadeIn(context, CardPage(tarjeta: card)));
                  },
                  child: Hero(
                    tag: card.cardNumber,
                    child: CreditCardWidget(
                      cardNumber: card.cardNumber,
                      expiryDate: card.expiracyDate,
                      cardHolderName: card.cardHolderName,
                      cvvCode: card.cvv,
                      showBackView: false,
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            child: TotalPayButton(),
          )
        ],
      ),
    );
  }
}
