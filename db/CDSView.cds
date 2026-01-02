using {rushidb1.master, rushidb1.transaction} from './data-model';
namespace rushicds;

context CDSView {
    define view![POWorkList] as 
        select from transaction.purchaseorder{
            Key po_id as![PurchaseOrderNo],
            Key items.po_item_pos as![Position],
            partner_guid.bp_id as![VendorId],
            partner_guid.company_name as ![CompanyName],
            items.gross_amount as ![GrossAmount],
            items.net_amount as ![NetAmount],
            items.tax_amount as ![TaxAmount],
            case overall_status
                when 'N' then 'New'
                when 'D' then 'Delivered'
                when 'P' then 'Pending'
                when 'A' then 'Approved'
                when 'X' then 'Rejected'
                end as ![Status],
            items.product_guid.description as ![Product],
            partner_guid.address_guid.country as ![Country]
        };

    define view![ProductVH] as 
        select from master.product{
            @EndUserText.label: [
                {
                    language: 'EN',
                    text: 'Product Id'
                },
                {
                    language: 'DE',
                    text: 'Prodekt Id'
                }
            ]
            product_id as ![ProductID],
            @EndUserText.label: [
                {
                    language: 'EN',
                    text: 'Product'
                },
                {
                    language: 'DE',
                    text: 'Prodekt'
                }
            ]
            description as ![Description]
        };

    define view ![ItemView] as  
        select from transaction.poitems{
            parent_key.partner_guid.node_key as ![VendorId],
            product_guid.node_key as ![ProductId],
            CURRENCY as ![Currency],
            gross_amount as ![GrossAmount],
            net_amount as ![NetAmount],
            tax_amount as ![TaxAmount],
            parent_key.overall_status as ![Status]
        };    
    
    define view ProductOrders as 
        select from master.product
    //maxin is a keyword provided by CAPM to perform lazy loading
    //it is same like association conccept in ABAP CDS views - lazy of loading of depended data
    mixin{
        po_orders: Association[*] to ItemView on po_orders.ProductId = $projection.ProductKey
    } into {
        node_key as ![ProductKey],
        description as ![ProductName],
        price as ![Price],
        supplier_guid.bp_id as ![SupplierId],
        supplier_guid.company_name as ![SupplierName],
        supplier_guid.address_guid.country as ![Country],
        //exposed association like ABAP which will lazy load orders of a given product
        //at runtime on demand
        po_orders as ![ProductOrder]
    };

    define view![CProductAnalytics] as 
        select from ProductOrders{
            ProductName,
            Country,
            sum(ProductOrder.GrossAmount) as ![TotalPurchaseAmount],
            ProductOrder.Currency
        }
        group by ProductName, Country, ProductOrder.Currency;
}