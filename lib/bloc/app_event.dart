part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class Create extends AppEvent {
  final String name;
  final String price;

  const Create(this.name, this.price);
}
