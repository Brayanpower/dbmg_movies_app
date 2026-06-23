import 'package:bdmg_movies_app/config/helpers/humar_format.dart';
import 'package:flutter/material.dart';

class MovieRaiting extends StatelessWidget {
  final double voteAverage;

  const MovieRaiting({super.key, required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return SizedBox(
      width: 150,
      child: Row(
        children: [
          Icon(Icons.star_half_rounded, color: Colors.yellow.shade800),
          const SizedBox(width: 3),
          Text(
            HumanFormats.number(voteAverage, 1),
            style: textStyle.bodyMedium?.copyWith(
              color: Colors.yellow.shade800,
            ),
          ),
        ],
      ),
    );
  }
}
