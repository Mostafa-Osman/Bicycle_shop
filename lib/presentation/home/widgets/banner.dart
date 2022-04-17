import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

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
                (e) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image(
                      image: NetworkImage(e.image),
                      width: double.infinity,
                      fit: BoxFit.cover,
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
              width: 10,
              height: 5,
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
