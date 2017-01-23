using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;

/*
    Shows the hours and minutes in roman numerals
    left justified with no additional markers.
*/
class SwagginNumeralsView extends Ui.WatchFace {

    /* fonts    */
    var spqr52;
    var spqr42;

    /* text positions */
    var hourY;
    var minY;
    var linY;
    var linX2;
    var timeX;

    /* Settings */
    var is24Hour;

    //! Initialize data
    function initialize() {
        WatchFace.initialize();
    }

    //! Load your resources here
    function onLayout(dc) {
        is24Hour = Application.getApp().getProperty("is24Hour");

        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_BLACK );
        spqr52 = Ui.loadResource(Rez.Fonts.spqr_52);
        spqr42 = Ui.loadResource(Rez.Fonts.spqr_42);

        hourY = dc.getHeight() / 2 - dc.getFontHeight( spqr52 );
        minY = hourY + dc.getFontHeight( spqr42 ) * 5/4;
        /*split the difference between the strings with a horizontal line */
        linY = minY - ( minY - hourY - dc.getFontHeight( spqr52 ) ) / 2;
        timeX = dc.getWidth() * 1/8;
        linX2 = dc.getWidth() * 7/8;


    }

    //! Called when this View is brought to the foreground. Restore
    //! the state of this View and prepare it to be shown. This includes
    //! loading resources into memory.
    function onShow() {
        spqr52 = Ui.loadResource(Rez.Fonts.spqr_52);
        spqr42 = Ui.loadResource(Rez.Fonts.spqr_42);
    }


    //! Update the view
    function onUpdate(dc) {
        /* Get the current time */
        var clockTime = Sys.getClockTime();
        var minString;
        var hourString;

        /* Apply time format settings */
        if( !is24Hour ){
            var temp;
            temp = clockTime.hour % 12 ;
            if( temp == 0 ){
                temp = 12;
            }

            hourString = RomanNumeral.numToRoman( temp );
        } else {
            hourString = RomanNumeral.numToRoman( clockTime.hour );
        }
        minString =  RomanNumeral.numToRoman( clockTime.min );

        /* Draw Time */
        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_BLACK );
		dc.clear();

        RomanNumeral.drawNumeralString( dc, hourString, spqr52, timeX, hourY );
        dc.setColor( Gfx.COLOR_LT_GRAY, Gfx.COLOR_BLACK );
        dc.drawLine( timeX, linY, linX2, linY );
        RomanNumeral.drawNumeralString( dc, minString, spqr42, timeX , minY );

    }

    //! Called when this View is removed from the screen. Save the
    //! state of this View here. This includes freeing resources from
    //! memory.
    function onHide() {
        spqr52 = null;
        spqr42 = null;
    }

    //! The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    //! Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}


