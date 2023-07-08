import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:post_request_using_bloc/repository/product_repo.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final ProductRepository productRepository;
  AppBloc({required this.productRepository}) : super(AppInitial()) {
    on<Create>((event, emit) async {
      emit(ProductsAdding());
      await Future.delayed((const Duration(seconds: 1)));
      try {
        await productRepository.create(name: event.name, price: event.price);
        emit(ProductsAdded());
      } catch (e) {
        emit(ProductsError(e.toString()));
      }
    });
  }
}
