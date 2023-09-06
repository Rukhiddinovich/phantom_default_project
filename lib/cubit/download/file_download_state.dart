part of 'file_download_cubit.dart';

class FileDownloadState {
  const FileDownloadState({
    required this.progress,
    required this.newFileLocation,
  });

  final double progress;
  final String newFileLocation;

  FileDownloadState copyWith({
    double? progress,
    String? newFileLocation,
  }) =>
      FileDownloadState(
        progress: progress ?? this.progress,
        newFileLocation: newFileLocation ?? this.newFileLocation,
      );
}
