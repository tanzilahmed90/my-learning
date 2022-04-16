({
	getselected : function(component, event, helper) {
        if(event.getSource().get("v.name")=="check1"){
            console.log("inside if1");
            component.set("v.checkInput2", false);
            component.set("v.checkInput3", false);
            component.set("v.checkInput4", false);
        }
        if(event.getSource().get("v.name")=="check2"){
             console.log("inside if2");
            component.set("v.checkInput1", false);
            component.set("v.checkInput3", false);
            component.set("v.checkInput4", false);
        }
        if(event.getSource().get("v.name")=="check3"){
            component.set("v.checkInput1", false);
            component.set("v.checkInput2", false);
            component.set("v.checkInput4", false);
        }
        if(event.getSource().get("v.name")=="check4"){
            component.set("v.checkInput1", true);
            component.set("v.checkInput2", true);
            component.set("v.checkInput3", true);
        }
	}
})