@EndUserText.label : 'Employees'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #ALLOWED
define table zemp_logali {

  key client : abap.clnt not null;
  @EndUserText.label : 'Nº de documento identificativo'
  key id     : abap.char(15) not null;
  @EndUserText.label : 'Correo electrónico'
  key email  : abap.char(50) not null;
  @EndUserText.label : 'Primer apellido'
  ape1       : abap.char(20);
  @EndUserText.label : 'Segundo apellido'
  ape2       : abap.char(20);
  @EndUserText.label : 'Nombre'
  name       : abap.char(30);
  @EndUserText.label : 'Fecha de nacimiento'
  fechan     : abap.dats;
  fechaa     : abap.dats;

}