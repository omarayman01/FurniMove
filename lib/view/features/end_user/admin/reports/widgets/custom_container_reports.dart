import 'package:flutter/material.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/avatar.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/modal_bottomsheet_offers.dart';

class CustomContainerReports extends StatelessWidget {
  const CustomContainerReports({
    super.key,
    required this.request,
    required this.user,
  });
  final RequestModel request;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalBottomSheet(
          enableDrag: true,
          // shape: Border.symmetric(),
          elevation: 10,
          backgroundColor: AppTheme.white,
          context: context,
          builder: (_) => ModalBottomSheetOffers(
                id: request.id.toString(),
                user: user,
              )),
      child: Container(
        height: 130,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppTheme.lightGrey.withOpacity(0.3),
        ),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Avatar(
              backColor: AppTheme.primarylight,
              height: 64,
              width: 64,
              url: request.customer!.userImgUrl,
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 5),
                Text(
                  request.customer!.userName.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      'From: ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      width: 140,
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        request.startAddress.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Text(
                      'To:     ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      width: 145,
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        request.endAddress.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text(
              '${request.cost.toString()}\$',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
