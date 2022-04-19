import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_flutter/presentation/search/cubit/search_cubit.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/build_item.dart';
import 'package:udemy_flutter/shared/components/component.dart';
import 'package:udemy_flutter/shared/components/custom_divider.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/empty_screen.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class SearchScreen extends StatelessWidget {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<SearchCubit>(context);

    return Scaffold(
      body: BlocBuilder<SearchCubit, SearchStates>(
        builder: (context, state) {
          return SafeArea(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          autofocus: true,
                          onFieldSubmitted: (text) {
                            if (text.isNotEmpty) {
                              searchCubit.getSearchData(text: text);
                            } else {
                              showToast(
                                message: 'Please Enter name of product',
                                state: ToastStates.warning,
                              );
                            }
                          },                          decoration: InputDecoration(
                            fillColor: Colors.grey[100],
                            filled: true,
                            contentPadding: const EdgeInsets.all(10),
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Search...',
                            hintStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: IconButton(
                          onPressed: () => navigateTo(
                            context,
                            RouteConstant.basketRoute,
                          ),
                          icon: SizedBox(
                            height: 40.0,
                            width: 40.0,
                            child: SvgPicture.asset(
                              'assets/icons/basket.svg',
                              fit: BoxFit.fitWidth,
                              color: mainColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (state is SearchLoading)
                  const Center(
                    child: CustomLoading(),
                  )
                else if (state is SearchError)
                  const Center(
                    child: CustomText(text: 'error 404'),
                  )
                else if (state is SearchSuccess &&
                      searchCubit.searchModel.data.isEmpty)
                    EmptyScreen()
                  else if (state is SearchSuccess &&
                        searchCubit.searchModel.data.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 70.0),
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return BuildItem(
                              model: searchCubit.searchModel.data[index],
                            );
                          },
                          separatorBuilder: (context, index) =>
                          const CustomDivider(),
                          itemCount: searchCubit.searchModel.data.length,
                        ),
                      )
                    else
                      const SizedBox(),
              ],
            ),
          );
        },
      ),
    );
  }
}
