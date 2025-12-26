using {rushidb1.master as master1,
    rushidb1.transaction as transactional1} from '../db/data-model';

//path is used to determine service end points
service catalogService @(path: 'CatalogService' ){
    entity addressSet as projection on master1.address;
    entity businesspartnerSet as projection on master1.businesspartner;
    entity employeesSet as projection on master1.employees;
    entity productSet as projection on master1.product;
    entity purchaseOrderSet as projection on transactional1.purchaseorder;
    entity po_item_set as projection on transactional1.poitems;
}