part of 'bubble_sort_page.dart';

class _BubbleSortForm extends StatelessWidget {
  const _BubbleSortForm();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BlocBuilder<SortingBloc, SortingState>(
                      builder: (BuildContext context, state) {
                        final array = state.store.sortedArray;

                        return Row(
                          children: [
                            for (int i = 0; i < array.length; i++)
                              Expanded(
                                child: Container(
                                  height: 40,
                                  margin: const EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    color: i == state.store.scannedIndex1 ||
                                            i == state.store.scannedIndex2
                                        ? AppColors.blue
                                        : AppColors.transparent,
                                    border: Border.all(),
                                  ),
                                  child: Center(
                                    child: Text(
                                      array[i].toString(),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
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
                  'start',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
