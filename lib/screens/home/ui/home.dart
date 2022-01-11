import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/screens/home/ui/body.dart';
import 'package:udemy_flutter/shared/styles/color.dart';
import '../home_cubit/states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return (state is! HomeSuccessState)
              ? const Center(
                  child: CircularProgressIndicator(
                  color: red,
                ))
              :  HomeBody(model:HomeCubit.get(context).homeModel);
        });
  }
}
