class VotingModel {
  final String id;
  final String title;
  final String description;
  final String endDate;
  final String? lastUpdated;
  final String image;
  final List<VotingOptionModel> options;
  final bool isClosed;
  bool hasUserVoted;

  VotingModel({
    required this.id,
    required this.title,
    required this.description,
    required this.endDate,
    this.lastUpdated,
    required this.image,
    required this.options,
    this.isClosed = false,
    this.hasUserVoted = false,
  });
}

class VotingOptionModel {
  final String id;
  final String title;
  final String? image; 
  final int totalVotes;

  VotingOptionModel({
    required this.id,
    required this.title,
    this.image,
    required this.totalVotes,
  });
}
