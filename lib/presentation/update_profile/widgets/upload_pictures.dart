import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udemy_flutter/presentation/profile/widgets/profile_photo.dart';
import 'package:udemy_flutter/presentation/update_profile/edit_profile_cubit/update_profile_cubit.dart';
import 'package:udemy_flutter/shared/components/custom_alert_dialog.dart';
import 'package:udemy_flutter/shared/components/custom_divider.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class UploadPictures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final updateProfileCubit = BlocProvider.of<UpdateProfileCubit>(context);
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            ProfilePhoto(),
            SizedBox(
              height: 32,
              width: 32,
              child: InkWell(
                child: SvgPicture.asset(
                  'assets/icons/add_icon.svg',
                ),
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomAlertDialog(
                      height: 200,
                      widget: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomDivider(thickness: 1),
                            ListTile(
                              leading: const Icon(
                                Icons.add_photo_alternate_outlined,
                              ),
                              title: TextButton(
                                child: const Text(
                                  'Gallery',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: mainColor,
                                  ),
                                ),
                                onPressed: () {
                                  updateProfileCubit.getImageFromGallery();
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.add_a_photo_outlined),
                              title: TextButton(
                                child: const Text(
                                  'Camera',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: mainColor,
                                  ),
                                ),
                                onPressed: () {
                                  updateProfileCubit.getImageFromCamera();
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
