using Toybox.System as Sys;
using Toybox.Graphics as Gfx;
using Toybox.Test as Test;
using Toybox.WatchUi as Ui;

class RomanNumeral {

	static const RomanValue =  [ 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 ];
	static const RomanNum = [ "M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];


    /* Could make these values a setting */
	hidden static const RomanColorDict	= { "I" => Gfx.COLOR_WHITE,
											"V" => Gfx.COLOR_YELLOW,
											"X" => Gfx.COLOR_ORANGE,
											"L" => Gfx.COLOR_RED,
											"C" => Gfx.COLOR_PINK,
											"D" => Gfx.COLOR_LT_GRAY,
											"M" => Gfx.COLOR_LT_GRAY};

    //!Draws the given string of numerals in the given font with correct colors on _one_line_
    //!@param: dc
    //!@param: numeralString
    //!@param: x text coordinate
    //!@param: y text coordinate
    static function drawNumeralString( dc, numeralString, font, x, y) {
        var textObj;

        for(var i = 0; i < numeralString.length(); i++) {
            var options = { :text => numeralString.substring( i, i+1 ),
                                    :backgroundColor => Gfx.COLOR_TRANSPARENT,
                                    :color => getColor( numeralString.substring( i, i+1 ) ),
                                    :font => font,
                                    :justification => Gfx.TEXT_JUSTIFY_LEFT,
                                    :locX => x,
                                    :locY => y };

            textObj = new Ui.Text( options );
            textObj.draw(dc);
            x += textObj.width;
        }
    }

	//!Returns the color associated with a given numeral, or green if no color is found.
	//!@param: numeral a string containing a single roman numeral character
	static function getColor( numeral ) {
		if( RomanColorDict.hasKey( numeral ) ) {
		  return RomanColorDict[ numeral ];
        }

		return Gfx.COLOR_DK_GREEN;
	}

	//!Converts an integer under 60 to a roman numeral string
	//!@param: number = number to convert to roman numeral string
	//! Code credit goes to this page --> https://github.com/FreeCodeCamp/FreeCodeCamp/wiki/Algorithm-Roman-Numeral-Converter
	static function numToRoman( number ) {

		Test.assert( number <= 60 and number >= 0 );

		var romStr = "";
		for ( var i = 0; i < RomanValue.size(); i++) {
            while( RomanValue[ i ] <= number ) {
                romStr = romStr + RomanNum[ i ];
                number -= RomanValue[ i ];
            }
		}

		return romStr;
	}
}
