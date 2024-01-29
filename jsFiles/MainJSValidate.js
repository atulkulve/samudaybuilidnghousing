// JScript File

function validateEmpty(txtcontrol,msg,Invalidmsg)
{
	if(txtcontrol.value.length == 0)
	{
		alert(msg);
		txtcontrol.focus();
		return false;
	}
	else
	{
		if (checkQuote(txtcontrol,Invalidmsg) == false)
		{		    
		    return false;
		}
		{
		    return true;
		}
	
	}
}
function checkQuote(k,Invalidtxt)
{
	var v = k.value;
	var patt1=new RegExp("'");
	if(patt1.test(v))
	{
		alert(Invalidtxt);
		return false;
	}	
	return true;
}
function validateDropDown(ddlcontrol,msg)
{
	if(ddlcontrol.selectedIndex == 0)
	{
		alert(msg);
		ddlcontrol.focus();
		return false;
	}	
	return true;
}
//elem.value.match(alphaExp
function isNotLetter(elem,helperMsg)
{
    var numericExpression = /^[0-9]+$/;
	if(elem.value.match(numericExpression)){
		return true;
	}else{
		alert(helperMsg);
		elem.focus();
		return false;
	}

}

function isNumber(c,msg)
{
	if (!(c.value>=0)&&(c.value<=9))
	{
		alert(msg);
		c.focus();
		return false;
	}
	return true;
}
//Restricting the length
function lengthRestriction(elem, min, max){
	var uInput = elem.value;
	if(uInput.length >= min && uInput.length <= max){
		return true;
	}else{
		alert("Please enter between " +min+ " and " +max+ " characters");
		elem.focus();
		return false;
	}
}
//Email Validation

function emailValidator(elem, msg){
	var emailExp = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
	if(elem.value.match(emailExp)){
		return true;
	}else{
		alert(msg);
		elem.focus();
		return false;
	}
}