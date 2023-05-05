import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_stock_unsplash_flutter/core/bloc/base_bloc_state.dart';
import 'package:image_stock_unsplash_flutter/core/utils/extensions/context_ext.dart';

class BaseBlocProvider<TBloc extends BlocBase<BaseBlocState>>
    extends BlocBuilder<TBloc, BaseBlocState> {

  final TBloc? bloc;
  final BlocWidgetBuilder<Object> builder;
  final Widget Function()? loader;

  const BaseBlocProvider({
    super.key,
    required this.bloc,
    required this.builder,
    this.loader,
  }) : super(bloc: bloc, builder: builder);

  @override
  Widget build(BuildContext context, BaseBlocState state) {
    if (state is ErrorBlocState) {
       context.showMessage(context, state.failure.message);
    }

    if (state is LoadingBlocState) {
      return loader?.call() ?? buildLoader();
    }

    if (state is ResultBlocState) {
      return builder(context, state.state);
    }

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
