import 'package:equatable/equatable.dart';

class FileDownloadModel extends Equatable {
  final String fileName;
  final String fileUrl;
  final double progress;
  final double memory;
  final String time;

  const FileDownloadModel({
    required this.fileName,
    required this.fileUrl,
    required this.progress,
    required this.memory,
    required this.time,
  });

  FileDownloadModel copyWith({
    String? fileName,
    String? fileUrl,
    double? progress,
    double? memory,
    String? time,
  }) =>
      FileDownloadModel(
        fileName: fileName ?? this.fileName,
        fileUrl: fileUrl ?? this.fileUrl,
        progress: progress ?? this.progress,
        memory: memory ?? this.memory,
        time: time ?? this.time,
      );

  @override
  List<Object?> get props => [
    fileName,
    fileUrl,
    progress,
    memory,
    time,
  ];
}

List<FileDownloadModel> filesData = [
  const FileDownloadModel(
    fileName: "PythonBook",
    fileUrl: "https://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf",
    progress: 0.0,
      memory: 78,
      time: "17:22"
  ),
  const FileDownloadModel(
    progress: 0.0,
    fileName: "Butterfly",
    fileUrl:
    "https://images.all-free-download.com/footage_preview/mp4/closeup_of_wild_butterfly_in_nature_6891908.mp4",
      memory: 78,
      time: "17:22"
  ),
  const FileDownloadModel(
    progress: 0.0,
    fileName: "Sabyan ya Rohman",
    fileUrl:
    "https://muzzona.kz/upload/files/2020-12/sabyan-gambus-rohman-ya-rohman_(muzzona.kz).mp3",
      memory: 78,
      time: "17:22"
  ),
  const FileDownloadModel(
    progress: 0.0,
    fileName: "Ajoyib rasm",
    fileUrl:
    "https://odam.uz/upload/media/posts/2019-10/21/mashhur-suratkash-ajoyib-rasm-olish-sirlarini-oshkor-qildi_1571694997-b.jpg",
      memory: 78,
      time: "17:22"
  ),
  const FileDownloadModel(
    progress: 0.0,
    fileName: "Foydali file",
    fileUrl:
    "https://foydali-fayllar.uz/wp-content/uploads/2021/04/informatika-test.doc.zip",
      memory: 78,
      time: "17:22"
  ),
];
