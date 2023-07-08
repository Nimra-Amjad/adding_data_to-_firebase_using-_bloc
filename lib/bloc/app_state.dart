part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {
  @override
  List<Object> get props => [];
}

class ProductsAdding extends AppState {
  @override
  List<Object> get props => [];
}

class ProductsAdded extends AppState {
  @override
  List<Object> get props => [];
}

class ProductsError extends AppState {
  final String error;
  ProductsError(this.error);
  @override
  List<Object> get props => [error];
}
