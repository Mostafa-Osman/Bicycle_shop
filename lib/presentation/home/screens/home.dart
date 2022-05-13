import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:udemy_flutter/presentation/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/presentation/home/widgets/banner.dart';
import 'package:udemy_flutter/presentation/home/widgets/product_item.dart';
import 'package:udemy_flutter/presentation/profile/cubit/profile_cubit.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/network_disconnected.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    BlocProvider.of<ProfileCubit>(context).getUserData();

    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CustomLoading());
        } else {
          if (state is HomeError) {
            return NetworkDisconnected(
              onPress: () {
                BlocProvider.of<ProfileCubit>(context).getUserData();
                BlocProvider.of<HomeCubit>(context).getHomeData();
              },
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                await Future.wait([
                  BlocProvider.of<ProfileCubit>(context).getUserData(),
                  BlocProvider.of<HomeCubit>(context).getHomeData(),
                ]);
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    BannerWidget(),
                    StaggeredGridView.countBuilder(
                      staggeredTileBuilder: (int index) =>
                          const StaggeredTile.fit(1),
                      padding: const EdgeInsets.only(bottom: 70.0),
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      itemCount: homeCubit.homeModel.data.detailsData.length,
                      itemBuilder: (BuildContext context, int index) =>
                          ProductItem(
                        index: index,
                      ),
                    ),
                    // const SizedBox(height: 70),
                  ],
                ),
              ),
            );
          }
        }
      },
    );
  }
}
