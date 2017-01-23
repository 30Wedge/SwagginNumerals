using Toybox.Lang as Lang;
/*
    To run unit tests.
        1) Build project with the --unit-test flag (copy-pasta eclipse build command to command prompt and add --unit-test in manually)
        2) Use the connectiq script in connectiqSDK/bin to start sim
        3) Use monkeydo.bat script in connectiqSDK/bin on app .prg file with /t flag
        TODO: ^Script this
*/


// Unit test to check Roman numeral conversion
(:test)
function test_numToRoman(logger) {
    var status = true;

	    status = status & test_case( logger, 10, "X" );
	    status = status & test_case( logger, 60, "LX" );
	    status = status & test_case( logger, 38, "XXXVIII" );
	    status = status & test_case( logger, 1, "I" );
	    status = status & test_case( logger, 5, "V" );
	    status = status & test_case( logger, 24, "XXIV" );
	    status = status & test_case( logger, 49, "XLIX" );
	    status = status & test_case( logger, 44, "XLIV" );
	    status = status & test_case( logger, 0, "" );

    return status;
}

hidden function test_case( logger, num, expectedString ){
    logger.debug("Test case: " + num + " | Expected: " + expectedString);

    if( !expectedString.equals( RomanNumeral.numToRoman( num ) )) {
        logger.debug("Observed: " + RomanNumeral.numToRoman( num ));
        return false;
    }
    return true;
}



class TestFailException extends Lang.Exception
{
    var msg;
    function initialize( m ){
        Exception.initialize();
        msg = m;
    }

    function getErrorMessage(){
        return msg;
    }
}
