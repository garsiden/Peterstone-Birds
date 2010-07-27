/*	Validation.js
 *	Validates conversion of strings to Date, Integer and Money data types
 */
 
function isInteger(integerString) {
	
	for (var i = 0; i < integerString.length; i++) {
		aChar = integerString.charAt(i);
		if (aChar < "0" || aChar > "9")
			return false;
	}
	return true;
}

function isDate(dateString) {
	// Check for dd/mm/yyyy format
	var dataFormat = /^\d{1,2}\/\d{1,2}\/\d{4}/;
	if (!dataFormat.test(dateString))
		return false;
	// Check converts to date
	var dateParts = dateString.split("/");
	var monthNum = parseInt(dateParts[1], 10) - 1;	// base required!
	try {
		var testDate = new Date(dateParts[2], monthNum, dateParts[0]);
		// Check for date rollover
		var checkYear = (testDate.getFullYear() == parseInt(dateParts[2]));
		var checkMonth = (testDate.getMonth() == monthNum);
		var dayPart = parseInt(dateParts[0], 10);
		var dateGet = testDate.getDate();
		var checkDay = (dayPart == dateGet);
		//var checkDay = (testDate.getDate() == parseInt(dateParts[0]));
	} catch (e) {
		return false;
	}
	return (checkYear && checkMonth && checkDay);
}

function isLongDate(dateString) {
	// Check for d-mmm-yyyy format
	var dataFormat = /^\d{1,2}\-[A-z]{3}\-\d{4}/;
	
	
	if (!dataFormat.test(dateString))
		return false;
	// Check converts to date
	var months = new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
	var dateParts = dateString.split("-");
	var monthNum = -1;	
	
	for (var i = 0; i < months.length; i++)
		if (months[i] == dateParts[1]) {
			monthNum = i;
			break;
		}
		
	if (monthNum == -1)
		return false;
		
	try {
		var testDate = new Date(dateParts[2], monthNum, dateParts[0]);
		// Check for date rollover
		var checkYear = (testDate.getFullYear() == parseInt(dateParts[2]));
		var checkMonth = (testDate.getMonth() == monthNum);
		var dayPart = parseInt(dateParts[0], 10);
		var dateGet = testDate.getDate();
		var checkDay = (dayPart == dateGet);
		//var checkDay = (testDate.getDate() == parseInt(dateParts[0]));
	} catch (e) {
		return false;
	}
	return (checkYear && checkMonth && checkDay);
}

function isMoney(moneyString) {
	//   (\\d){1,15}(\\.(\\d){2})?"
	//  /^\u00A3?\d+\.?\d*|\.\d+/;
	
	// /\d+\.?\d*|\.\d+/
	
	var numRegExp = /\d+\.?\d*|\.\d+/;
	var result = numRegExp.test(moneyString);
	if (result == true) {
		numRegExp = /[^0-9, \.]/;
		result = !(numRegExp.test(moneyString));
	}
	return result;
}

// Check an item is selected in a drop down list for Custom Validator
function isItemSelected(source, arguments) {

	if (arguments.Value < 1)
		arguments.IsValid = false;
	else
		arguments.IsValid = true;
		
}

// Check an item is selected in a drop down list for Custom Validator
function isItemSelectedGuid(source, arguments) {
	
	if (arguments.Value == "00000000-0000-0000-0000-000000000000")
		arguments.IsValid = false;
	else
		arguments.IsValid = true;
		
}
