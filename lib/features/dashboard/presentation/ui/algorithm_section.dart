part of 'dashboard_page.dart';

class _AlgorithmSection extends StatelessWidget {
  final String title;
  final RouteId viewAllRouteId;
  final List<AlgorithmCardConfig> algorithmCardConfigs;

  const _AlgorithmSection({
    required this.title,
    required this.viewAllRouteId,
    required this.algorithmCardConfigs,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          trailing: InkWell(
            onTap: () => RouteHandler.push(context, viewAllRouteId),
            child: Text(
              'View All',
              style: TextStyle(
                color: AppColors.blue.withOpacity(0.9),
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 250,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: algorithmCardConfigs.length,
            padding: const EdgeInsets.all(8),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (BuildContext context, int index) {
              return AlgorithmCard(
                algorithmCardConfig: algorithmCardConfigs[index],
                backgroundColor: getColorFromIndex(index),
              );
            },
          ),
        ),
      ],
    );
  }
}
