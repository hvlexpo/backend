import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'user.dart';

@immutable
class AppState extends Equatable {
  /// Represents whether the app is in a loading state or not
  final bool isLoading;

  /// The current user of the app
  final User user;

  AppState({this.isLoading = false, this.user});

  factory AppState.loading() => AppState(isLoading: true);

  AppState copyWith({bool isLoading, User user}) {
    return AppState(
        isLoading: isLoading ?? this.isLoading, user: user ?? this.user);
  }

  @override
  String toString() {
    return 'AppState{ isLoading: $isLoading, user: $user }';
  }
}
