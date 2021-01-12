import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/models/cards.dart';

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
            onPressed: () {},
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
                return CreditCardWidget(
                  cardNumber: card.cardNumber,
                  expiryDate: card.expiracyDate,
                  cardHolderName: card.cardHolderName,
                  cvvCode: card.cvv,
                  showBackView: false,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
