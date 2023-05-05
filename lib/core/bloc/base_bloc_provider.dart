import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_stock_unsplash_flutter/core/bloc/base_bloc_state.dart';

class BaseBlocProvider<TBloc extends BlocBase<BaseBlocState>> extends BlocBuilder<TBloc, BaseBlocState> {
  final TBloc? bloc;
  final BlocWidgetBuilder<Object> builder;
  final Widget Function()? error;

  BaseBlocProvider({
    required this.bloc,
    required this.builder,
    this.error,
  }) : super(bloc: bloc, builder: builder);

  @override
  Widget build(BuildContext context, BaseBlocState state) {
    if (state is ErrorBlocState) {
      return error?.call() ?? buildError(context, state);
    } else if (state is LoadingBlocState) {
      return buildLoader();
    } else if (state is ResultBlocState) {
      return builder(context, state.state);
    }

    return Container();
  }

  Widget buildError(BuildContext context, ErrorBlocState state) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.failure.message),
          duration: const Duration(seconds: 2),
        ),
      );
    });

    return Container();
  }

  Widget buildLoader() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
