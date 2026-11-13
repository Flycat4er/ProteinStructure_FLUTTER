sealed class ProteinDetailEvent {
  const ProteinDetailEvent(this.id);

  final String id;
}

final class ProteinDetailOpened extends ProteinDetailEvent {
  const ProteinDetailOpened(super.id);
}

final class ProteinDetailRetried extends ProteinDetailEvent {
  const ProteinDetailRetried(super.id);
}
