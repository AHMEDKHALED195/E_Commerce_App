import 'package:e_commerce_app/features/home/presentation/cubits/profile_details_cubit/profile_details_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/profile_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ProfileDetailsViewBlocConsumer extends StatelessWidget {
  const ProfileDetailsViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileDetailsCubit, ProfileDetailsState>(
      listener: (context, state) {
        if (state is ProfileDetailsSaveSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تم حفظ التغييرات بنجاح')),
          );
          Navigator.pop(context);
        } else if (state is ProfileDetailsSaveFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ProfileDetailsSaveLoading,
          child: const ProfileDetailsViewBody(),
        );
      },
    );
  }
}
