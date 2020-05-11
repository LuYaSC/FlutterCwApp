class PopularFilterListData {
  PopularFilterListData({
    this.titleTxt = '',
    this.isSelected = false,
    this.limit = 0,
  });

  String titleTxt;
  bool isSelected;
  double limit;

    static List<PopularFilterListData> authList = <PopularFilterListData>[
    PopularFilterListData(
      titleTxt: 'Remberto Hilaquita Mamani',
      limit: 10000.0,
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Carlos Enrique Moring',
       limit: 100.0,
      isSelected: false,
    ),
  ];

  static List<PopularFilterListData> popularFList = <PopularFilterListData>[
    PopularFilterListData(
      titleTxt: 'Solicitados',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Controlados',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Autorizados',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'En Proceso',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Procesado',
      isSelected: false,
    ),
     PopularFilterListData(
      titleTxt: 'No Procesado',
      isSelected: false,
    ),
  ];

  static List<PopularFilterListData> accomodationList = [
    PopularFilterListData(
      titleTxt: 'Todos',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Pendientes',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Autorizados',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Procesados',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Solicitados',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Rechazados',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'En Proceso',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'No Procesado',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Confirmado',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Operacion Fecha Futura',
      isSelected: false,
    ),
  ];

  static List<PopularFilterListData> operationList = [
    PopularFilterListData(
      titleTxt: 'Todos',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Transferencia al Exterior',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Pago de Haberes',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Pago de Servicios',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Transferencias entre cuentas propias',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Transferencias a cuentas de terceros',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Pago a Proveedores',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Pagos Multiples',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Pagos Favoritos',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Pago a proveedores a otro banco (ACH)',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Pago a Proveedores en efectivo',
      isSelected: false,
    ),
  ];
}
