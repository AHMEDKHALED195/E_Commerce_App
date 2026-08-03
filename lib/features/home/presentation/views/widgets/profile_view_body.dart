import 'dart:convert';

import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/cubits/local_cubit.dart';
import 'package:e_commerce_app/core/cubits/theme_cubit.dart';
import 'package:e_commerce_app/core/services/language_picker_dialog.dart';

import 'package:e_commerce_app/core/services/shared_prefrences_singelton.dart';
import 'package:e_commerce_app/core/utiles/app_colors.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/home/presentation/views/profile_details_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/logout_button.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/profile_avatar_haeder.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/profile_menu_item.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/profile_section_label.dart';
import 'package:e_commerce_app/features/orders/presentaion/views/my_orders_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const String kNotificationsEnabledKey = 'notificationsEnabled';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  late bool notificationsEnabled;

  @override
  void initState() {
    super.initState();
    // القيمة الافتراضية true لو المستخدم لسه ما غيرش الإعداد قبل كده
    notificationsEnabled = Prefs.getString(kNotificationsEnabledKey) != 'false';
  }

  void _onNotificationsChanged(bool value) {
    setState(() => notificationsEnabled = value);
    Prefs.setString(kNotificationsEnabledKey, value.toString());
    // ملحوظة: ده بيحفظ التفضيل بس، لسه محتاج نربطه بـ Firebase Messaging
    // (اشتراك/إلغاء اشتراك في التوبيك أو تفعيل/تعطيل الإذن) لما تتأكد إنه مظبوط.
  }

  UserModel _getCachedUserData() {
    var jsonData = Prefs.getString(kUserData);
    return UserModel.fromJson(jsonDecode(jsonData));
  }

  @override
  Widget build(BuildContext context) {
    var user = _getCachedUserData();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: Column(
        children: [
          const SizedBox(height: 16),

          // الكارت الرئيسي - قابل للسكرول لو المحتوى زاد عن حجم الشاشة
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor == Colors.white
                      ? Colors.white
                      : Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFEDEEEE)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileAvatarHeader(
                      name: user.displayName,
                      email: user.email,
                    ),
                    const SizedBox(height: 12),
                    const Divider(color: Color(0xFFEDEEEE), height: 1),
                    const ProfileSectionLabel(text: 'عام'),
                    ProfileMenuItem(
                      icon: Icons.person_outline,
                      title: 'الملف الشخصي',
                      onTap: () async {
                        await Navigator.pushNamed(
                          context,
                          ProfileDetailsView.routeName,
                        );
                        // نعمل ريفريش لما نرجع عشان الاسم يتحدث فورًا
                        if (context.mounted) setState(() {});
                      },
                    ),
                    ProfileMenuItem(
                      icon: Icons.inventory_2_outlined,
                      title: 'طلباتي',
                      onTap: () {
                        Navigator.pushNamed(context, MyOrdersView.routeName);
                      },
                    ),
                    ProfileMenuItem(
                      icon: Icons.credit_card_outlined,
                      title: 'المدفوعات',
                      onTap: () {
                        // TODO: هنربطها لما نجهز شاشة المدفوعات
                      },
                    ),
                    ProfileMenuItem(
                      icon: Icons.favorite_border,
                      title: 'المفضلة',
                      onTap: () {
                        // TODO: هنربطها لما نجهز شاشة المفضلة
                      },
                    ),
                    ProfileMenuItem(
                      icon: Icons.notifications_none,
                      title: 'الاشعارات',
                      trailing: Switch(
                        value: notificationsEnabled,
                        activeColor: AppColors.primaryColor,
                        onChanged: _onNotificationsChanged,
                      ),
                    ),
                    BlocBuilder<LocaleCubit, Locale>(
                      builder: (context, locale) {
                        return ProfileMenuItem(
                          icon: Icons.language,
                          title: 'اللغة',
                          valueText: locale.languageCode == 'ar'
                              ? 'العربية'
                              : 'English',
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => const LanguagePickerDialog(),
                            );
                          },
                        );
                      },
                    ),
                    // الوضع الليلي - متصل بـ ThemeCubit فعليًا
                    BlocBuilder<ThemeCubit, ThemeMode>(
                      builder: (context, themeMode) {
                        return ProfileMenuItem(
                          icon: Icons.dark_mode_outlined,
                          title: 'الوضع',
                          trailing: Switch(
                            value: themeMode == ThemeMode.dark,
                            activeColor: AppColors.primaryColor,
                            onChanged: (value) {
                              context.read<ThemeCubit>().toggleTheme(value);
                            },
                          ),
                        );
                      },
                    ),
                    const Divider(color: Color(0xFFEDEEEE), height: 1),
                    const ProfileSectionLabel(text: 'المساعده'),
                    ProfileMenuItem(
                      icon: Icons.info_outline,
                      title: 'من نحن',
                      onTap: () {
                        // TODO: هنربطها لما نجهز شاشة من نحن
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),
          const LogoutButton(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
