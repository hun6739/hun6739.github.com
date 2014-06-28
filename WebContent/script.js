
function writeSave(){
	var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if(document.writeform.email.value==""){
		  alert("email");
		  document.writeform.email.focus();
		  return false;
	} else {
		if(!regExp.test(document.writeform.email.value)) {
			alert("email check");
			document.writeform.email.focus();
			  return false;
		}
	}
	if(document.writeform.passwd.value==""){
	  alert("password");
	  document.writeform.passwd.focus();
	  return false;
	}

 }

function modifySave() {
	if( document.modifyform.passwd.value=="" ) {
		alert( "password");
		document.modifyform.passwd.focus();
		return false;
	}	
}

function modifyViewSave(){
		var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if(document.modifyview.email.value==""){
			  alert("email");
			  document.modifyview.email.focus();
			  return false;
		} else {
			if(!regExp.test(document.modifyview.email.value)) {
				alert("email check");
				document.modifyview.email.focus();
				return false;
			}
		}
		
		if(document.modifyview.passwd.value==""){
		  alert("password");
		  document.modifyview.passwd.focus();
		  return false;
		}
 }
