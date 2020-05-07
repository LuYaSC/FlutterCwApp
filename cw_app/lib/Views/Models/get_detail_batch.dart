class GetDetailBatch {
  int id;
  int batchId;
  int processBatchId;
  int batch;

  GetDetailBatch() {
    this.id = 0;
    this.batchId = 0;
    this.processBatchId = 0;
    this.batch = 0;
  }

  GetDetailBatch.fromJson(Map json)
      : id = json['id'],
        batchId = json['batchId'],
        processBatchId = json['processBatchId'],
        batch = json['batch'];

  dynamic toJson() {
    return {
      'id': id,
      'batchId': batchId,
      'processBatchId': processBatchId,
      'batch': batch,
    };
  }
}
