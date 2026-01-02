namespace rushidb1;
using { cuid, temporal, managed, Currency } from '@sap/cds/common';
using { commons as common} from './common';

context master {
    entity businesspartner {
        key node_key: common.guid;
        bp_role: String(2);
        email_address:String(100);
        phone_number:String(20);
        fax_number:String(32);
        web_address: String(44);
        address_guid: Association to one address;
        bp_id: String(32);
        company_name: String(250);
    }

    entity address {
        key node_key: common.guid;
        city: String(50);
        postal_code:String(8);
        street: String(128);
        building:String(44);
        address_type: String(44);
        val_start_date: Date;
        val_end_date: Date;
        latitude: Decimal;
        longitude: Decimal;
        businesspartner: Association to one businesspartner on businesspartner.address_guid = $self;
        country: String(40);
    }

    entity product {
        key node_key: common.guid;
        product_id: String(28);
        type_code: String(2);
        category: String(32);
        description: localized String(255);
        supplier_guid: Association to one master.businesspartner;
        tax_tarif_code: Integer;
        measure_unit: String(2);
        weight_unit: String(2);
        weight_measure: Decimal(5,2);
        currency_code: String(4);
        price: Decimal(15,2);
        width:Decimal(5,2);
        height:Decimal(5,2);
        depth:Decimal(5,2);
        dim_unit:String(2);
    }   

    entity employees: cuid{
        nameFirst: String(40);
        nameMiddle: String(40);
        nameLast: String(40);
        nameInitials: String(40);
        sex: common.gender;
        language: String(1);
        phoneNumber: common.phoneNumber;
        email: common.emailAddress;
        loginName: String(12);
        Currency: Currency;
        salaryAmount: common.amountT;
        accountNumber: String(16);
        bankid: String(8);
        bankname: String(64);
    }
}

context transaction {
    entity purchaseorder: common.amount {
        key node_key: common.guid;
        po_id: String(40);
        partner_guid: Association to master.businesspartner;
        lifecycle_status: String(1);
        overall_status: String(1);
        items: Association to many poitems on items.parent_key = $self;
    }

    entity poitems : common.amount{
        key node_key: common.guid;
        parent_key: Association to purchaseorder;
        po_item_pos: Integer;
        product_guid: Association to master.product;
    }
}