import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';


class PrimaryBtn extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  final Icon icon ;
  const PrimaryBtn({super.key, required this.title, required this.onTap,  this.loading = false, required this.icon,});

  @override
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return InkWell(
      onTap: loading ? null : onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: loading
              ? Colors.grey
              : Theme.of(context).colorScheme.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            loading
                ? SizedBox(
              height: 24,
              width: 24,
              child: LoadingIndicator(
                indicatorType: Indicator.ballClipRotate,
                colors: [Colors.white],
              ),
            )
                : const Icon(Icons.lock_outline_rounded, color: Colors.white),
            SizedBox(width: width * 0.02),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
