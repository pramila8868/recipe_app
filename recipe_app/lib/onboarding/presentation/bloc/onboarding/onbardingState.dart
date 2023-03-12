// ignore_for_file: must_be_immutable

part of 'onbardingCubit.dart';

@immutable
abstract class OnbardingState {}

class OnbardingInitial extends OnbardingState {}

class OnboardingLoaded extends OnbardingState {
  int activePageIndex;

  OnboardingLoaded({required this.activePageIndex});

  List<Object> get props => [activePageIndex];
}
