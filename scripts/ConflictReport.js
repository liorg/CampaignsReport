
function performCheck() {
    if (checkValidationGroup("datepickerGroup")) {
        //                alert('it is valid');
        return true;
    }
    else {
        //                alert('No valid');
        return false;
    }
}
function checkValidationGroup(valGrp) {
    var rtnVal = true;
    for (i = 0; i < Page_Validators.length; i++) {
        if (Page_Validators[i].validationGroup == valGrp) {
            ValidatorValidate(Page_Validators[i]);
            if (!Page_Validators[i].isvalid) {
                //  debugger;
                alert(Page_Validators[i].getAttribute("errormessage"));
                //at least one is not valid.       
                rtnVal = false;
                break;
                //exit for-loop, we are done.              
            }
        }
    }
    return rtnVal;
}



$(function () {

    $("#datepickerProposedStartDate").datepicker({ dateFormat: 'dd-mm-yy' });
    $("#datepickerProposedEndDate").datepicker({ dateFormat: 'dd-mm-yy' });

  
});

function ClearField() {
    $("#datepickerProposedStartDate").datepicker('setDate', null);
    $("#datepickerProposedEndDate").datepicker('setDate', null);
    $("#datepickerActualStartDate").datepicker('setDate', null);
    $("#datepickerActualEndDate").datepicker('setDate', null);
}
