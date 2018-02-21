({
	init: function(component, event, helper) {
        component.set("v.data", 
                      { done: false, values: [], value1: 0, value2: 0, value3: 0 });
        component.set("v.columns", [
            { sortable: true, label: "Key Prefix", fieldName: "keyPrefix", type: "text" },
            { sortable: true, label: "API Name", fieldName: "apiName", type: "text" }
        ]);
        helper.getNext(component);
	},
    filter: function(component, event, helper) {
        helper.filter(component);
    },
    sort: function(component, event, helper) {
        component.set("v.sortField", event.getParam("fieldName"));
        component.set("v.sortDirection", event.getParam("sortDirection"));
        helper.filter(component);
    }
})