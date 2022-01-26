import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/screens/search/cubit/cubit.dart';
import 'package:udemy_flutter/screens/search/cubit/states.dart';
import 'package:udemy_flutter/shared/components/build_item.dart';
import 'package:udemy_flutter/shared/components/custom_divider.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/loading.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class SearchScreen extends StatelessWidget {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = SearchCubit.get(context).searchModel;
        return Scaffold(
          body: SafeArea(
            child: Stack(children: [
              Container(
                margin: EdgeInsets.only(top: 10.0, left: 10.0),
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        autofocus: true,
                        onFieldSubmitted: (text) =>
                            SearchCubit.get(context).search(text),
                        decoration: InputDecoration(
                          fillColor: Colors.grey[100],
                          filled: true,
                          contentPadding: EdgeInsets.all(10),
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search...',
                          hintStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: IconButton(
                        onPressed: () =>
                            navigateTo(context, RouteConstant.basketRoute),
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
              (state is SearchInitialState)
                  ? SizedBox()
                  : (state is SearchLoadingState)
                      ? Center(
                          child:CustomLoading(),
                        )
                      : (state is SearchErrorState)
                          ? Center(
                              child: CustomText(text: 'error 404'),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 70.0),
                              child: ListView.separated(
                                  itemBuilder: (context, index) => BuildItem(
                                      model: model!.data!.data[index]),
                                  separatorBuilder: (context, index) =>
                                      CustomDivider(),
                                  itemCount: model!.data!.data.length),
                            ),
            ]),
          ),
        );
      },
    );
  }
}
