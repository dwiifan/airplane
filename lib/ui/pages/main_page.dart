import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/ui/pages/home_page.dart';
import 'package:airplane/ui/pages/setting_page.dart';
import 'package:airplane/ui/pages/transaction_page.dart';
import 'package:airplane/ui/pages/wallet_page.dart';
import 'package:airplane/ui/widgets/Custom_Buttom_Navigation_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class MainPage extends StatelessWidget {
  Widget buildContent(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return TransactionPage();
      case 2:
        return WalletPage();
      case 3:
        return SettingPage();
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget customButtomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            bottom: 30,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButtomNavigationItem(
                index: 0,
                ImageUrl: 'assets/icon_home.png',
              ),
              CustomButtomNavigationItem(
                index: 1,
                ImageUrl: 'assets/icon_booking.png',
              ),
              CustomButtomNavigationItem(
                index: 2,
                ImageUrl: 'assets/icon_card.png',
              ),
              CustomButtomNavigationItem(
                index: 3,
                ImageUrl: 'assets/icon_settings.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackGroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customButtomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
