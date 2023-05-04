import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_stock_unsplash_flutter/core/bloc/base_bloc_state.dart';

abstract class BaseState<
    TState extends StatefulWidget,
    TBloc extends BlocBase<BaseBlocState>, TBlocState> extends State<TState> {

  TBloc? _bloc;

  @override
  void initState() {
    _bloc = createBloc(context);
    super.initState();
  }

  TBloc createBloc(BuildContext context);

  Widget buildWidget(BuildContext context, TBlocState result);

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TBloc, BaseBlocState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is ErrorBlocState) {
          return buildError(context, state);
        } else if (state is LoadingBlocState) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is ResultBlocState) {
          return buildWidget(context, state.state);
        } else {
          return Container();
        }
      },
    );
  }
}
