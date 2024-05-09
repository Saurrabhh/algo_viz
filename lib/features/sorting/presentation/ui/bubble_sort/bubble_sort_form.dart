part of 'bubble_sort_page.dart';

class _BubbleSortForm extends StatelessWidget {
  const _BubbleSortForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        text1: 'Bubble ',
        text2: 'Sort',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _ArrayGrid(),
                  SizedBox(
                    height: 16,
                  ),
                  Align(
                    child: _Message(),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: getBloc<SortingBloc>(context).startBubbleSort,
              child: const Text(
                'Sort',
              ),
            ),
          ],
        ),
      ),
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
            crossAxisCount: 5,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: array.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              height: 40,
              decoration: BoxDecoration(
                color: index == state.store.scannedIndex1
                    ? AppColors.blue
                    : index == state.store.scannedIndex2
                        ? AppColors.yellow
                        : AppColors.transparent,
                border: Border.all(),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  array[index].toString(),
                  style: const TextStyle(
                    fontSize: 24,
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
              : const SizedBox(),
        };
      },
    );
  }
}
