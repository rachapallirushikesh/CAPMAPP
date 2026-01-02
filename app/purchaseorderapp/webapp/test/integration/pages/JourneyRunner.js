sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/po/purchaseorderapp/test/integration/pages/purchaseOrderSetList",
	"com/po/purchaseorderapp/test/integration/pages/purchaseOrderSetObjectPage",
	"com/po/purchaseorderapp/test/integration/pages/po_item_setObjectPage"
], function (JourneyRunner, purchaseOrderSetList, purchaseOrderSetObjectPage, po_item_setObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/po/purchaseorderapp') + '/test/flpSandbox.html#compopurchaseorderapp-tile',
        pages: {
			onThepurchaseOrderSetList: purchaseOrderSetList,
			onThepurchaseOrderSetObjectPage: purchaseOrderSetObjectPage,
			onThepo_item_setObjectPage: po_item_setObjectPage
        },
        async: true
    });

    return runner;
});

