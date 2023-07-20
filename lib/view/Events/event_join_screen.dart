import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgethomescreen.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/controller/provider/event-payment-provider/event_payment.dart';
import 'package:founder_app/view/home/homescreen/homescreen.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class EventJoin extends StatefulWidget {
  const EventJoin({
    super.key,
    required this.title,
    required this.content,
    required this.mentorImage,
    required this.mentorName,
    required this.venue,
    required this.dateAndTime,
    required this.fee,
    required this.eventId,
    required this.joinLink,
  });

  final String title;
  final String content;
  final String mentorImage;
  final String mentorName;
  final String venue;
  final String dateAndTime;
  final int fee;
  final String eventId;
  final String joinLink;

  @override
  State<EventJoin> createState() => _EventJoinState();
}

class _EventJoinState extends State<EventJoin> {
  // Razorpay razorpay = Razorpay();
  PaymentProvider paymentProvider = PaymentProvider();
  @override
  void initState() {
    super.initState();
    final paymentProvider =
        Provider.of<PaymentProvider>(context, listen: false);
    final razorpay = paymentProvider.razorpay;
    razorpay.on(
        Razorpay.EVENT_PAYMENT_SUCCESS, paymentProvider.handlePaymentSuccess);
    razorpay.on(
        Razorpay.EVENT_PAYMENT_ERROR, paymentProvider.handlePaymentError);
    razorpay.on(
        Razorpay.EVENT_EXTERNAL_WALLET, paymentProvider.handleExternalWallet);
  }

  @override
  void dispose() {
    paymentProvider.razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
            // statusBarColor: Color.fromARGB(233,238,242,255),
            statusBarColor: Colors.white),
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: appBarLogo(context, 0.3),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                    (route) => false);
              },
              child: const Text("Home ")),
          appBarArticleHome(context),
          wBox
        ],
      ),
      body: Center(
        child: Container(
          width: 350,
          height: 600,
          decoration: BoxDecoration(
            color: backgroundColorConst,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          // color: Color.fromARGB(233, 168, 170, 177),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // hBox,
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    // width: MediaQuery.of(context).size.width * 0.25,
                    decoration: const BoxDecoration(
                      // color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child:
                          Image.network(widget.mentorImage, fit: BoxFit.cover),
                    ),
                  ),
                  hBox,
                  mediumHeading(widget.title),
                  hBoxS,
                  descriptionText(widget.content),
                  hBox,
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // descriptionText(venue),
                      const Icon(
                        Icons.mic_rounded,
                        color: iconcolor,
                      ),
                      wBox,
                      descriptionText(widget.mentorName),
                    ],
                  ),
                  hBoxS,
                  Row(
                    children: [
                      const Icon(
                        Icons.discord,
                        color: iconcolor,
                      ),
                      wBox,
                      descriptionText(widget.venue),
                    ],
                  ),
                  hBoxS,
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        color: iconcolor,
                      ),
                      wBox,
                      descriptionText(widget.dateAndTime),
                    ],
                  ),
                  hBox,
                  textNormalHeading(
                      "Join now for just \$${widget.fee} dollers.!"),
                  hBoxS,
                  descriptionText("Get invitation to your registerd Email."),
                  hBoxS,
                  Container(
                    height: MediaQuery.of(context).size.height * 0.055,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 50, 103, 137),
                      border: Border.all(
                          color: const Color.fromARGB(255, 105, 153, 189)),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: TextButton(
                        onPressed: () {
                          double exchangeRate = 73;
                          double rupeeAmount = widget.fee * exchangeRate;
                          log(rupeeAmount.toString());
                          Provider.of<PaymentProvider>(context, listen: false)
                              .openCheckout(rupeeAmount, widget.eventId,
                                  widget.joinLink, context);
                        },
                        child: const Text(
                          "PAY and JOIN",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
