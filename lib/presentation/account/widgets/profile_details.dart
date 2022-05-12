import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ProfileDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: CustomCard(
        paddingLeft: 0.0,
        height: MediaQuery.of(context).size.height / 10.0,
        width: MediaQuery.of(context).size.width,
        widget: ListTile(
          leading: ClipOval(
            child: CachedNetworkImage(
              height: 50,
              width: 50,
              fit: BoxFit.cover,
              imageUrl: userData.data.image,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[100]!,
                highlightColor: Colors.grey[300]!,
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
              ),
            ),
          ),
          title: CustomText(
            text: userData.data.name,
            fontSize: 18.0,
          ),
          subtitle: CustomText(
            text: userData.data.phone,
            fontSize: 15,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: mainColor,
            size: 25.0,
          ),
        ),
      ),
      onTap: () => navigateTo(context, RouteConstant.profileRoute),
    );
  }
}
