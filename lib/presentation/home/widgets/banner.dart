import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'package:udemy_flutter/presentation/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return Column(
      children: [
        //banner
        CarouselSlider(
          items: homeCubit.banner.data
              .map(
                (e) => Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CachedNetworkImage(
                    imageUrl: e.image,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => Container(
                      height: 130.0,
                      color: Colors.white,
                      width: double.infinity,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[100]!,
                        highlightColor: Colors.grey[300]!,
                        child: Image.asset(
                          'assets/images/logo.png',
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            height: 200.0,
            initialPage: 4,
            viewportFraction: 1.0,
            onPageChanged: (index, _) {
              return homeCubit.changeBannerIndex(index);
            },
          ),
        ),
        //indicator
        SizedBox(
          height: 10,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => Container(
              width: 10.0,
              height: 2.5,
              decoration: BoxDecoration(
                color: homeCubit.indicatorIndex == index
                    ? mainColor
                    : const Color(0XFFF4CCCC),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
            ),
            separatorBuilder: (_, index) => const SizedBox(width: 5),
            itemCount: homeCubit.banner.data.length,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
