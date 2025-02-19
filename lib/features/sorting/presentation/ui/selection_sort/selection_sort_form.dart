part of 'selection_sort_page.dart';

class _SelectionSortForm extends StatelessWidget {
  const _SelectionSortForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        text1: 'Selection ',
        text2: 'Sort',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                    onPressed: getBloc<SortingBloc>(context).speedButtonClicked,
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
            const SizedBox(
              height: 4,
            ),
            const _SelectionSortTheory(),
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
    return BlocBuilder<SortingBloc, SortingState>(
      builder: (BuildContext context, state) {
        return ElevatedButton(
          onPressed: !state.store.isSorting
              ? getBloc<SortingBloc>(context).randomizeButtonClicked
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
    return BlocBuilder<SortingBloc, SortingState>(
      builder: (BuildContext context, state) {
        return ElevatedButton(
          onPressed: !state.store.isSorting
              ? getBloc<SortingBloc>(context).lengthButtonClicked
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
    return BlocBuilder<SortingBloc, SortingState>(
      builder: (BuildContext context, state) {
        return ElevatedButton(
          onPressed: !state.store.isSorting
              ? getBloc<SortingBloc>(context).startSelectionSort
              : null,
          child: const Text(
            'Sort',
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
    return BlocBuilder<SortingBloc, SortingState>(
      builder: (BuildContext context, state) {
        final array = state.store.sortedArray;

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
                color: state.store.sortedIndexes.contains(index) ||
                        state.store.isArraySorted
                    ? AppColors.green
                    : index == state.store.scannedIndex1
                        ? AppColors.blue
                        : index == state.store.scannedIndex2
                            ? AppColors.yellow
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

class _Message extends StatelessWidget {
  const _Message();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SortingBloc, SortingState>(
      builder: (BuildContext context, state) {
        return switch (state) {
          ScannedIndex(:final store) => Text(
              '''Scanning index ${store.scannedIndex1} and ${store.scannedIndex2}.''',
            ),
          SwappedIndex(:final store) => Text(
              '''Swapping index ${store.scannedIndex1} and ${store.scannedIndex2}.''',
            ),
          NoNeedOfSwap() => const Text('No Need of swap'),
          _ => state.store.isArraySorted
              ? const Text('Sorting Completed')
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
    return BlocBuilder<SortingBloc, SortingState>(
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
                      label: state.store.sortingSpeed.toString(),
                      divisions: state.store.maxSortingSpeed,
                      value: state.store.sortingSpeed.toDouble(),
                      min: state.store.minSortingSpeed.toDouble(),
                      max: state.store.maxSortingSpeed.toDouble(),
                      onChanged: (sortingSpeed) => getBloc<SortingBloc>(context)
                          .changeSortingSpeed(sortingSpeed.toInt()),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 2,
                    child: _SliderTextField(
                      value: state.store.sortingSpeed.toString(),
                      onChanged: (sortingSpeed) =>
                          getBloc<SortingBloc>(context).changeSortingSpeed(
                        int.tryParse(sortingSpeed) ?? state.store.sortingSpeed,
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
    return BlocBuilder<SortingBloc, SortingState>(
      builder: (BuildContext context, state) {
        if (state.store.showLengthSlider && !state.store.isSorting) {
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
                      onChanged: (arrayLength) => getBloc<SortingBloc>(context)
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
                          getBloc<SortingBloc>(context).changeArrayLength(
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

class _SelectionSortTheory extends StatefulWidget {
  const _SelectionSortTheory();

  @override
  State<_SelectionSortTheory> createState() => _SelectionSortTheoryState();
}

class _SelectionSortTheoryState extends State<_SelectionSortTheory> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          icon:
              Icon(_isExpanded ? Icons.keyboard_arrow_up : Icons.info_outline),
          label: const Text('Info'),
        ),
        if (_isExpanded)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selection Sort Algorithm',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  '1. Find the smallest element in the array.\n'
                  '2. Swap it with the first element.\n'
                  '3. Find the next smallest element in the remaining array.\n'
                  '4. Swap it with the next position.\n'
                  '5. Repeat until the entire array is sorted.',
                ),
                SizedBox(height: 8),
                Text(
                  'Complexity Analysis:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Best Case: O(n²)\n'
                  'Worst Case: O(n²)\n'
                  'Average Case: O(n²)\n'
                  'Space Complexity: O(1) (In-place Sorting)',
                ),
              ],
            ),
          ),
      ],
    );
  }
}
