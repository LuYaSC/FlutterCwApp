class GetDetailBatch {
  int id;
  int batchId;
  int processBatchId;

  GetDetailBatch() {
    this.id = 0;
    this.batchId = 0;
    this.processBatchId = 0;
  }

  GetDetailBatch.fromJson(Map json)
      : id = json['id'],
        batchId = json['batchId'],
        processBatchId = json['processBatchId'];

  dynamic toJson() {
    return {
      'id': id,
      'batchId': batchId,
      'processBatchId': processBatchId,
    };
  }
}
