import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final isError;
  final mediaQuery;
  final onTap;
  const ErrorDialog({Key? key, this.isError, this.mediaQuery, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      bottom: isError ? 20 : -60,
      duration: const Duration(milliseconds: 500),
      child: SizedBox(
        height: 50,
        width: mediaQuery.width,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: 50,
            width: mediaQuery.width * 0.9,
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(14))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Erro no login'),
                  GestureDetector(
                    onTap: onTap,
                    //TODO: PASSAR FUNCÃO COMO PARÂMETRO
                    // onTap: () {
                    //   setState(() {
                    //     isError = !isError;
                    //   });
                    // },
                    child: const Icon(
                      Icons.close,
                      size: 40.0,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
