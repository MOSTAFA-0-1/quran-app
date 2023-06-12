import 'package:equatable/equatable.dart';

class QiblaStates extends Equatable {
  bool hasPermission;

  QiblaStates({this.hasPermission = false});
  QiblaStates copyWith({bool? hasPermission}) {
    return QiblaStates(hasPermission: hasPermission ?? this.hasPermission);
  }

  @override
  List<Object?> get props => [hasPermission];
}
