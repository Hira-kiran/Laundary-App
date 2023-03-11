import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internshippractice/Constants/colors.dart';
import '../Constants/textstyle.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: pinkColor,
        centerTitle: true,
        title: const Text("IDEAL"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Expanded(
                      child: Container(
                        height: 200.h,
                        // width: 330.w,
                        decoration: const BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ListTile(
                              leading:
                                  Text("Total sale:", style: profiletotalText),
                              trailing:
                                  Text("\$360", style: profileTotalTextValue),
                            ),
                            ListTile(
                              leading:
                                  Text("Commision", style: profileCommision),
                              trailing:
                                  Text("\$0", style: profileTotalTextValue),
                            ),
                            ListTile(
                              leading: Text("Project", style: profileproject),
                              trailing:
                                  Text("null", style: profileTotalTextValue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Expanded(
                      child: Container(
                        height: 50.h,
                        decoration: const BoxDecoration(
                            color: pinkColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Center(
                            child: Text("Welcome : abc",
                                style: profileWelcomeAbc)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Expanded(
                child: Container(
                  height: 240.h,
                  // width: 330.w,
                  decoration: const BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Text("Transection", style: transection),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          color: pinkColor,
                          height: 50.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child:
                                    Text("Credit", style: creditDebitRemarks),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 40),
                                child: Text("Debit", style: creditDebitRemarks),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child:
                                    Text("Remarks", style: creditDebitRemarks),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text("60\$", style: creditValue),
                            ),
                            Text("0\$", style: debitValue),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child:
                                  Text("Ticket sale no.57", style: ticketSale),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text("100\$", style: creditValue),
                            ),
                            Text("0\$", style: debitValue),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child:
                                  Text("Ticket sale no.60", style: ticketSale),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text("60\$", style: creditValue),
                            ),
                            Text("0\$", style: debitValue),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child:
                                  Text("Ticket sale no.62", style: ticketSale),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text("60\$", style: creditValue),
                            ),
                            Text("0\$", style: debitValue),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child:
                                  Text("Ticket sale no.56", style: ticketSale),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
