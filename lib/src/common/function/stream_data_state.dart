class StreamDataState<T> {
  final bool isLoading;
  final T data;
  final String? error;

  StreamDataState({
    this.isLoading = false,
    required this.data,
    this.error,
  });

  factory StreamDataState.loading() => StreamDataState(isLoading: true, data: [] as T);
  factory StreamDataState.success(T data) => StreamDataState(isLoading: false, data: data);
  factory StreamDataState.error(String e) => StreamDataState(isLoading: false, data: [] as T, error: e);
}
