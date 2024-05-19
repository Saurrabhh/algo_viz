part of 'linear_search_page.dart';

class _LinearSearchForm extends StatelessWidget {
  const _LinearSearchForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        text1: 'Linear ',
        text2: 'Search',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _NumberTextField(),
            const Align(
              child: _Message(),
            ),
            const SizedBox(
              height: 16,
            ),
            const Expanded(
              child: _ArrayGrid(),
            ),
            const SizedBox(
              height: 16,
            ),
            const _SpeedSlider(),
            const SizedBox(
              height: 8,
            ),
            const _LengthSlider(),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed:
                        getBloc<SearchingBloc>(context).speedButtonClicked,
                    child: const Text(
                      'Speed',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                const Expanded(
                  child: _LengthButton(),
                ),
                const SizedBox(
                  width: 8,
                ),
                const _ShuffleButton(),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const _StartButton(),
          ],
        ),
      ),
    );
  }
}

class _ShuffleButton extends StatelessWidget {
  const _ShuffleButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchingBloc, SearchingState>(
      builder: (BuildContext context, state) {
        return ElevatedButton(
          onPressed: !state.store.isSearching
              ? getBloc<SearchingBloc>(context).randomizeButtonClicked
              : null,
          style: ElevatedButton.styleFrom(shape: const CircleBorder()),
          child: const Icon(
            Icons.shuffle_outlined,
            color: AppColors.blue,
          ),
        );
      },
    );
  }
}

class _LengthButton extends StatelessWidget {
  const _LengthButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchingBloc, SearchingState>(
      builder: (BuildContext context, state) {
        return ElevatedButton(
          onPressed: !state.store.isSearching
              ? getBloc<SearchingBloc>(context).lengthButtonClicked
              : null,
          child: const Text(
            'Length',
          ),
        );
      },
    );
  }
}

class _StartButton extends StatelessWidget {
  const _StartButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchingBloc, SearchingState>(
      builder: (BuildContext context, state) {
        return ElevatedButton(
          onPressed: !state.store.isSearching
              ? getBloc<SearchingBloc>(context).startLinearSearch
              : null,
          child: const Text(
            'Search',
          ),
        );
      },
    );
  }
}

class _ArrayGrid extends StatelessWidget {
  const _ArrayGrid();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchingBloc, SearchingState>(
      builder: (BuildContext context, state) {
        final array = state.store.array;

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: kIsWeb ? 20 : 5,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: array.length,
          itemBuilder: (context, index) {
            return Container(
              height: 40,
              decoration: BoxDecoration(
                color: state.store.searchingCompleted
                    ? state.store.array[state.store.searchedIndex] ==
                                state.store.numberToSearch &&
                            index == state.store.searchedIndex
                        ? AppColors.green
                        : AppColors.transparent
                    : state.store.isSearching
                        ? index < state.store.searchedIndex
                            ? AppColors.red
                            : index == state.store.searchedIndex
                                ? AppColors.blue
                                : AppColors.transparent
                        : AppColors.transparent,
                border: Border.all(),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: FittedBox(
                  child: Text(
                    array[index].toString(),
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _NumberTextField extends StatelessWidget {
  const _NumberTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchingBloc, SearchingState>(
      builder: (BuildContext context, state) {
        if(state.store.isSearching){
          return const SizedBox();
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              flex: 8,
              child: Text(
                'Enter number to search: ',
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 2,
              child: TextField(
                // controller: controller,
                onChanged: (numberToSearch) =>
                    getBloc<SearchingBloc>(context).changeNumberToSearch(
                  int.tryParse(numberToSearch),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        );
      },
    );
  }
}

class _Message extends StatelessWidget {
  const _Message();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchingBloc, SearchingState>(
      builder: (BuildContext context, state) {
        return switch (state) {
          SearchedIndex(:final store) => Text(
              '''Searched Number ${store.array[store.searchedIndex]}.''',
            ),
          _ => state.store.searchingCompleted
              ? state.store.array[state.store.searchedIndex] ==
                      state.store.numberToSearch
                  ? Text('Number found at index ${state.store.searchedIndex}')
                  : const Text('Number not found')
              : const Text(''),
        };
      },
    );
  }
}

class _SpeedSlider extends StatelessWidget {
  const _SpeedSlider();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchingBloc, SearchingState>(
      builder: (BuildContext context, state) {
        if (state.store.showSpeedSlider) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'Speed',
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Slider(
                      label: state.store.searchingSpeed.toString(),
                      divisions: state.store.maxSearchingSpeed,
                      value: state.store.searchingSpeed.toDouble(),
                      min: state.store.minSearchingSpeed.toDouble(),
                      max: state.store.maxSearchingSpeed.toDouble(),
                      onChanged: (searchingSpeed) =>
                          getBloc<SearchingBloc>(context)
                              .changeSearchingSpeed(searchingSpeed.toInt()),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 2,
                    child: _SliderTextField(
                      value: state.store.searchingSpeed.toString(),
                      onChanged: (searchingSpeed) =>
                          getBloc<SearchingBloc>(context).changeSearchingSpeed(
                        int.tryParse(searchingSpeed) ??
                            state.store.searchingSpeed,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}

class _LengthSlider extends StatelessWidget {
  const _LengthSlider();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchingBloc, SearchingState>(
      builder: (BuildContext context, state) {
        if (state.store.showLengthSlider && !state.store.isSearching) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'Array Length',
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Slider(
                      label: state.store.arrayLength.toString(),
                      divisions: state.store.maxArrayLength,
                      value: state.store.arrayLength.toDouble(),
                      min: state.store.minArrayLength.toDouble(),
                      max: state.store.maxArrayLength.toDouble(),
                      onChanged: (arrayLength) =>
                          getBloc<SearchingBloc>(context)
                              .changeArrayLength(arrayLength.toInt()),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 2,
                    child: _SliderTextField(
                      value: state.store.arrayLength.toString(),
                      onChanged: (val) =>
                          getBloc<SearchingBloc>(context).changeArrayLength(
                        int.tryParse(val) ?? state.store.arrayLength,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}

class _SliderTextField extends StatefulWidget {
  final String value;
  final ValueChanged<String> onChanged;

  const _SliderTextField({
    required this.value,
    required this.onChanged,
  });

  @override
  State<_SliderTextField> createState() => _SliderTextFieldState();
}

class _SliderTextFieldState extends State<_SliderTextField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) {
    controller.text = widget.value;

    return TextField(
      controller: controller,
      onChanged: widget.onChanged,
      keyboardType: TextInputType.number,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
