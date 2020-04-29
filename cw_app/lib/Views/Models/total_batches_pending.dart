
import 'batch_pendings_cw.dart';

class TotalBatchesPending {
  List<BatchPendingsCw> batchestoControl;
  List<BatchPendingsCw> batchestoAuthorize;

  TotalBatchesPending() {
    this.batchestoControl = new List<BatchPendingsCw>();
    this.batchestoAuthorize = new List<BatchPendingsCw>();
  }
}
