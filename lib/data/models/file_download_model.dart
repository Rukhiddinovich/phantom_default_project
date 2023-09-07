import 'package:equatable/equatable.dart';

class FileDownloadModel extends Equatable {
  final String fileName;
  final String fileUrl;
  final double progress;
  final double memory;

  const FileDownloadModel({
    required this.fileName,
    required this.fileUrl,
    required this.progress,
    required this.memory,
  });

  FileDownloadModel copyWith({
    String? fileName,
    String? fileUrl,
    double? progress,
    double? memory,
  }) =>
      FileDownloadModel(
        fileName: fileName ?? this.fileName,
        fileUrl: fileUrl ?? this.fileUrl,
        progress: progress ?? this.progress,
        memory: memory ?? this.memory,
      );

  @override
  List<Object?> get props => [
        fileName,
        fileUrl,
        progress,
        memory,
      ];
}

List<FileDownloadModel> filesData = [
  const FileDownloadModel(
      fileName: "PythonBook",
      fileUrl: "https://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf",
      progress: 0.0,
      memory: 2.5,
  ),
  const FileDownloadModel(
    progress: 0.0,
    fileName: "Butterfly",
    fileUrl:
        "https://images.all-free-download.com/footage_preview/mp4/closeup_of_wild_butterfly_in_nature_6891908.mp4",
    memory: 0.5
  ),
  const FileDownloadModel(
    progress: 0.0,
    fileName: "Music",
    fileUrl:
        "https://muzzona.kz/upload/files/2020-12/sabyan-gambus-rohman-ya-rohman_(muzzona.kz).mp3",
    memory: 3,
  ),
  const FileDownloadModel(
    progress: 0.0,
    fileName: "Picture",
    fileUrl:
        "https://odam.uz/upload/media/posts/2019-10/21/mashhur-suratkash-ajoyib-rasm-olish-sirlarini-oshkor-qildi_1571694997-b.jpg",
    memory: 1.2,
  ),
  const FileDownloadModel(
    progress: 0.0,
    fileName: "File",
    fileUrl:
        "https://foydali-fayllar.uz/wp-content/uploads/2021/04/informatika-test.doc.zip",
    memory: 2.3,
  ),
  const FileDownloadModel(
    progress: 0.0,
    fileName: "Movie",
    memory: 1024,
    fileUrl:
        "http://fayllar1.ru/23/Seriallar/Grim/Grim%20f01q08-qism%20AQSH%20seriali%20O'zbek%20tilida%20(asilmedia.net).m4v",
  ),
  const FileDownloadModel(
      fileName: "Maqom",
      fileUrl: "http://www.classicmusic.uz/media/Shashmaqom/history-&-modernity_1/The%20Keepers%20of%20Maqom%20traditions.wmv",
      progress: 0.0,
      memory: 81.67,
  ),
];
