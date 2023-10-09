//part of 'onboarding_bloc.dart';

import 'package:flutter/material.dart';

@immutable
abstract class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class PageChangedState extends OnboardingState {
  final int counter;

  PageChangedState({
    required this.counter,
  });
}

class NextScreenState extends OnboardingState {}
