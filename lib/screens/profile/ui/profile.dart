import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/profile/cubit/profile_cubit.dart';
import 'package:udemy_flutter/screens/profile/cubit/states.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ProfileScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  // var nameController = TextEditingController();
  // var emailController = TextEditingController();
  // var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ProfileCubit.get(context).userModel!.data;

        return ConditionalBuilder(
          condition: (state is ProfileLoadingState||state is ProfileInitialState),
          builder:(context) => Center(
              child: CircularProgressIndicator(
                color: red,
              )),
          fallback: (context) => SingleChildScrollView(
            child: Align(
              //alignment: Alignment.topCenter,
              child: Container(
                width: 500,
                color: white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 30),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: black,
                                  width: 1.3,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: ClipOval(
                                    child: Image.network(
                                      model!.image!,
                                      height: 180,
                                      width: 180,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              model.name!,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.clip,
                            ),
                            SizedBox(height: 20),
                            AccountTextFormField(
                              text: model.phone!,
                              icon: Icons.phone,
                            ),
                            SizedBox(height: 3),
                            AccountTextFormField(
                              text: model.email!,
                              icon: Icons.email,
                            ),
                            AccountTextFormField(
                              text: model.points.toString(),
                              icon: Icons.account_balance_wallet,
                            ),
                            AccountTextFormField(
                              text: model.credit.toString(),
                              icon: Icons.view_compact_outlined,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AccountTextFormField extends StatelessWidget {
  final String text;
  final IconData icon;

  AccountTextFormField({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color:lightMainColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          shape: BoxShape.rectangle,
        ),
        child: Container(
          margin: EdgeInsets.only(right: 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: size.width >= 500 ? 25 : size.width / 20,
                    padding: const EdgeInsets.all(0.0),
                    icon: Icon(icon),
                    color: mainColor,
                    onPressed: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: CustomText(
                      text: text,
                      fontSize: size.width >= 500 ? 18 : size.width / 22,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
