part of 'profile_details_cubit.dart';

sealed class ProfileDetailsState {}

final class ProfileDetailsInitial extends ProfileDetailsState {}

final class ProfileDetailsSaveLoading extends ProfileDetailsState {}

final class ProfileDetailsSaveSuccess extends ProfileDetailsState {}

final class ProfileDetailsSaveFailure extends ProfileDetailsState {
  final String message;
  ProfileDetailsSaveFailure(this.message);
}
