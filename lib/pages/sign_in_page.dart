import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/theme.dart';

class SignInPage extends StatelessWidget {
  TextEditingController usernameController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn(String agent) async {
      if (await authProvider.join(username: agent
          // username: usernameController.text,
          )) {
        Navigator.pushNamed(context, '/detail-chat');
      }
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Live Chat',
              style:
                  primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 24),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "Chat simulation",
              style: subtitleTextStyle,
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
          margin: EdgeInsets.only(top: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Username",
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icon_username.png',
                        width: 17,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: TextFormField(
                        controller: usernameController,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Username anda',
                            hintStyle: subtitleTextStyle),
                      ))
                    ],
                  ),
                ),
              )
            ],
          ));
    }

    // Widget passwordInput() {
    //   return Container(
    //       margin: EdgeInsets.only(top: 20),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             "Password",
    //             style:
    //                 primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
    //           ),
    //           SizedBox(
    //             height: 12,
    //           ),
    //           Container(
    //             height: 50,
    //             padding: EdgeInsets.symmetric(
    //               horizontal: 16,
    //             ),
    //             decoration: BoxDecoration(
    //               color: backgroundColor2,
    //               borderRadius: BorderRadius.circular(12),
    //             ),
    //             child: Center(
    //               child: Row(
    //                 children: [
    //                   Image.asset(
    //                     'assets/icon_password.png',
    //                     width: 17,
    //                   ),
    //                   SizedBox(
    //                     width: 16,
    //                   ),
    //                   Expanded(
    //                       child: TextFormField(
    //                     obscureText: true,
    //                     style: primaryTextStyle,
    //                     decoration: InputDecoration.collapsed(
    //                         hintText: 'Your Password',
    //                         hintStyle: subtitleTextStyle),
    //                   ))
    //                 ],
    //               ),
    //             ),
    //           )
    //         ],
    //       ));
    // }

    Widget signInButton1() {
      return Container(
        margin: EdgeInsets.only(top: 150),
        height: 50,
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            handleSignIn('agen1');
          },
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Text(
            'Mulai Chat sebagai Agen1',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget signInButton2() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 50),
        child: TextButton(
          onPressed: () {
            handleSignIn('agen2');
          },
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Text(
            'Mulai Chat sebagai Agen2',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'created by dicky darmawan',
              style: subtitleTextStyle.copyWith(fontSize: 12),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              // emailInput(),
              // passwordInput(),
              signInButton1(),
              signInButton2(),
              Spacer(),
              footer()
            ],
          ),
        ),
      ),
    );
  }
}
