import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:userprofile/common/export.dart';
import 'package:userprofile/module/user_profile_list/widgets/dash_container.dart';

import '../../../data/model/user_model.dart';

class UserDetailCard extends StatelessWidget {
  const UserDetailCard({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DashContainer(
      width: double.maxFinite,
      borderRadius: 30,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(AssetPaths.maleAvatar, height: 125))
                .pb(16),
            Text(
              "${user.name}",
              style: context.textStyles.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.color.primaryColor,
              ),
            ).pb(2),
            Text(
              "@${user.username}",
              style: context.textStyles.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ).pb(8),
            GestureDetector(
              onTap: () {
                final Uri phoneUri = Uri(
                  scheme: 'tel',
                  path: user.phone,
                );
                _launchUrl(phoneUri);
              },
              child: Text(
                "Phone: ${user.phone}",
              ).pb(6),
            ),
            GestureDetector(
              onTap: () {
                final Uri emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: user.email,
                );
                _launchUrl(emailLaunchUri);
              },
              child: Text.rich(TextSpan(children: [
                const TextSpan(text: "Email: "),
                TextSpan(
                    text: "${user.email}",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: context.color.secondaryColor,
                        fontStyle: FontStyle.italic))
              ])).pb(6),
            ),
            Text(
              "Street: ${user.address?.street}",
            ).pb(6),
            Text(
              "Suite: ${user.address?.suite}",
            ).pb(6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    "City: ${user.address?.city}",
                  ).pr(8),
                ),
                Flexible(
                  child: Text(
                    "Zip Code: ${user.address?.zipcode}",
                  ),
                ),
              ],
            ).pb(6),
            GestureDetector(
              onTap: () {
                final Uri url = Uri(
                  scheme: 'https',
                  path: user.website,
                );
                _launchUrl(url);
              },
              child: Text.rich(TextSpan(children: [
                const TextSpan(text: "Website: "),
                TextSpan(
                    text: "http://www.irhqw.com",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: context.color.secondaryColor,
                        fontStyle: FontStyle.italic))
              ])),
            ),
          ]),
    );
  }
}
