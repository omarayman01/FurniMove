import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/confirmation_bottomsheet.dart';
import 'package:furni_move/view/core/custom_widgets/confirmation_password_bottomsheet.dart';

class UserConfirmation extends StatelessWidget {
  const UserConfirmation({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'E-mail',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppTheme.grey),
            ),
            InkWell(
              onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (_) => ConfirmationBottomSheet(
                        verified: user.emailConfirmed,
                        token: user.token,
                        text: 'E-mail',
                        hintText: user.email!,
                        radius: 5,
                      )),
              child: user.emailConfirmed
                  ? Text(
                      'Verified',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppTheme.green, fontWeight: FontWeight.bold),
                    )
                  : Text(
                      'Verified',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppTheme.red),
                    ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Divider(thickness: 4, color: AppTheme.dividerGrey),
        const SizedBox(height: 20),
        Text('Change Credentials',
            style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Password',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppTheme.grey),
            ),
            InkWell(
              onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (_) => ConfirmationPasswordBottomSheet(
                        text: 'Password',
                        hintText: user.toString(),
                        radius: 1,
                      )),
              child: Text(
                'Change',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppTheme.red),
              ),
            ),
          ],
        )
      ],
    );
  }
}
