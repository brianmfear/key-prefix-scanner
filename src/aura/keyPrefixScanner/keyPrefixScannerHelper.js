({
	getNext: function(component) {
        var action = component.get("c.lightningFindKeys"),
            data = component.get("v.data");
        action.setParams({
            value1: data.value1,
            value2: data.value2,
            value3: data.value3
        });
        action.setCallback(this, result => {
            var temp = result.getReturnValue(),
            	data = component.get("v.data");
            temp.values = data.values.concat(temp.values);
            component.set("v.data", temp);
            component.set("v.progress", 
				Math.floor(100*(((data.value1*3844)+(data.value2*62)+data.value3)/238328)));
            temp.done? this.filter(component): this.getNext(component);
        });
        $A.enqueueAction(action);
	},
    filter: function(component) {
        var searchText = component.get("v.searchText"),
            data = component.get("v.data"),
            rx = new RegExp(searchText),
            field = component.get("v.sortField"),
            asc = component.get("v.sortDirection") == "asc"? 1: -1,
            rxi = new RegExp(searchText, "i");
        component.set(
            "v.filtered", 
            data.values
            .filter(value => !searchText || rx.test(value.keyPrefix) || rxi.test(value.apiName))
            .sort((a,b) => asc * (a[field] < b[field]? -1: 1))
        );
    }
})