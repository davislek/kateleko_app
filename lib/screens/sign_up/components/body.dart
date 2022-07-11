import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:katale_ko_client/components/socal_card.dart';
import 'package:katale_ko_client/constants.dart';
import 'package:katale_ko_client/services/auth_service.dart';
import 'package:katale_ko_client/size_config.dart';

import '../../complete_profile/complete_profile_screen.dart';
import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                Text("Register Account", style: headingStyle),
                Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () async{
                        User? result = await Authentication().googleSignIn(context);
                        if(result != null){
                          Navigator.pushNamed(
                              context, CompleteProfileScreen.routeName);
                        }
                      },
                    ),
                    //SocalCard(
                      //icon: "assets/icons/facebook-2.svg",
                      //press: () {

                     // },
                    //),
                    //SocalCard(
                      //icon: "assets/icons/twitter.svg",
                     // press: () {},
                   // ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  'By continuing your confirm that you agree \nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
