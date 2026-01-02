using { rushicds as cdsV } from '../db/CDSView';
using { rushidb1.master } from '../db/data-model';

service MyService @(path: 'MyService') {

    function pokemon(name: String(20)) returns String;
    entity ProductOrderSet as projection on cdsV.CDSView.ProductOrders{
        *,
        ProductOrder
    };

    entity ReadEmployeeSet as projection on master.employees;


}