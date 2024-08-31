function enablesubmitbtn()//Enable subnit button
{
	if (document.getElementById("chkbx").checked)
	{
		
		document.getElementById("sub").disabled = false ;
		
	}
	else
	{
		
		document.getElementById("sub").disabled = true;
		
	}
}