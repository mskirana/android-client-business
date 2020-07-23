import 'package:flutter/material.dart';

/// Selectable allows having provisions to have a unique identifier
/// , a selectable option (triggered by parent), and a parentNotifier
/// to provision triggering
abstract class Selectable extends StatelessWidget {
  final int idx;
  final bool selected;
  final Function(int idx) notifyParent;

  Selectable({@required this.idx, this.selected, this.notifyParent});
}
