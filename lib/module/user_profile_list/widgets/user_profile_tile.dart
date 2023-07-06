import 'package:flutter/material.dart';
import 'package:userprofile/common/export.dart';

import '../../../data/model/user_model.dart';
import 'dash_container.dart';
import 'tap_effect.dart';
import 'user_detail_card.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      child: InkResponse(
        onTap: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  content: UserDetailCard(
                    user: user,
                  )));
        },
        child: DashContainer(
          width: double.maxFinite,
          padding: const EdgeInsets.all(16),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: context.color.lightGrey.withOpacity(.4),
            )
          ],
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "${user.name}",
              style: context.textStyles.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.color.primaryColor,
              ),
            ).pb(2),
            Text(
              "@${user.username}",
              style: context.textStyles.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ).pb(6),
            Text(
              "Phone: ${user.phone}",
            ).pb(4),
            Text(
              "Address: ${user.address?.street}, ${user.address?.city}",
            ).pb(4),
          ]),
        ),
      ),
    );
  }
}
