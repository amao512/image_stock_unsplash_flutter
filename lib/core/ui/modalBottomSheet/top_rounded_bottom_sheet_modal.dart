import 'package:flutter/material.dart';

extension ModalBottomSheetExt on BuildContext {
  Future showFullHeightModalBottomSheet({
    required Widget widget,
  }) {
    return showModalBottomSheet(
      context: this,
      builder: (context) => widget,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: Theme.of(this).primaryColor,
    );
  }
}
