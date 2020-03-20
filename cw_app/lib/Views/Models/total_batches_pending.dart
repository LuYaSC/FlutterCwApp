import 'batch_pendings.dart';

class TotalBatchesPending {
  List<BatchPendings> batchestoControl;
  List<BatchPendings> batchestoAuthorize;

  TotalBatchesPending() {
    this.batchestoControl = new List<BatchPendings>();
    this.batchestoAuthorize = new List<BatchPendings>();
  }
}
