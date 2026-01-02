sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.po.purchaseorderapp',
            componentId: 'po_item_setObjectPage',
            contextPath: '/purchaseOrderSet/items'
        },
        CustomPageDefinitions
    );
});