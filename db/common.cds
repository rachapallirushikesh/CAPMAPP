namespace commons;
using { Currency } from '@sap/cds/common';

type gender: String(1) enum{
    Male = 'M';
    Female = 'F';
    Undisclosed = 'U'
}

type amountT: Decimal(10,2)@(
    Semantics.amount.currencyCode: 'CURRENCY_CODE',
    sap.unit: 'CURRENCY_CODE'
);

aspect amount: {
    CURRENCY: Currency;
    gross_amount: amountT @title : 'Gross Amount';
    net_amount: amountT @title : 'Net Amount';
    tax_amount: amountT @title : 'Tax Amount';
}

//reusable data type
    type guid: String(32);

    type phoneNumber: String(30)@assert.format : '^(\+91[- ]?)?[6-9]\d{9}$';
    type emailAddress: String(50)@assert.format: '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$';
    // aspect to hold address data. same as domain, dataelement, structures in SE11. Reusable.
    // INCLUDE structure
    aspect address{
        houseno: Int16;
        street: String(40);
        city:String(10);
        country:String(30);
    }