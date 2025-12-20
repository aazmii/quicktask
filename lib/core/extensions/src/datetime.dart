part of '../extension.dart';

extension DateTimeExt on DateTime {
  String get timeAgo {
    final Duration diff = DateTime.now().difference(this);

    if (diff.inMinutes < 1) {
      return '1m';
    }

    if (diff.inHours < 1) {
      return '${diff.inMinutes}m';
    }

    if (diff.inDays < 1) {
      final hours = diff.inHours;
      final minutes = diff.inMinutes % 60;

      if (minutes == 0) {
        return '${hours}h';
      }
      return '${hours}h${minutes}m';
    }

    if (diff.inDays < 30) {
      return '${diff.inDays}d';
    }

    if (diff.inDays < 365) {
      return '${(diff.inDays / 30).floor()}mo';
    }

    return '${(diff.inDays / 365).floor()}y';
  }
}
