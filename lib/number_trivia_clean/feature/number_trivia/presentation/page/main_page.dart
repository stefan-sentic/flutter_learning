import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/number_trivia_clean/feature/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:learning/number_trivia_clean/feature/number_trivia/presentation/widget/widgets.dart';

import '../../../../injection_container.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Number Trivia"),
      ),
      body: buildBody(),
    );
  }

  BlocProvider<NumberTriviaBloc> buildBody() {
    return BlocProvider(
      create: (_) => sl<NumberTriviaBloc>(),
      child: BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: switch (state) {
                  Empty() => const TriviaData(text: 'Start searching!'),
                  Loading() => const TriviaLoading(),
                  Data() => TriviaData(number: state.data.number, text: state.data.text),
                  Error() => TriviaError(message: state.message)
                }),
                const TriviaControls()
              ],
            ),
          );
        },
      ),
    );
  }
}
