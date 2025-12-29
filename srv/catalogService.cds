using {rushidb1.master as master1,
    rushidb1.transaction as transactional1} from '../db/data-model';

//path is used to determine service end points
service catalogService @(path: 'CatalogService' ){
    entity addressSet as projection on master1.address;
    entity businesspartnerSet as projection on master1.businesspartner;
    // @readonly - can't create any records or update
    entity employeesSet as projection on master1.employees;
    entity productSet as projection on master1.product;
    entity purchaseOrderSet as projection on transactional1.purchaseorder;
    entity po_item_set as projection on transactional1.poitems
    actions{
        //increaments gross amount value each time we send request
        action boost() returns po_item_set;
        // fetches record of largest parchase order item record
        function largestValue() returns po_item_set;
    };
}