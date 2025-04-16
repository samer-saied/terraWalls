part of 'mainapp_cubit.dart';

@immutable
sealed class MainappState {}

final class MainappInitial extends MainappState {}

final class MainappChanging extends MainappState {}

final class MainappChanged extends MainappState {}
