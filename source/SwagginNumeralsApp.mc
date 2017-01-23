using Toybox.Application as App;

class SwagginNumeralsApp extends App.AppBase {

    function initialize() {
        AppBase.initialize();
    }


    //! onStop() is called when your application is exiting
    function onStop( state ) {
    }

    //! Return the initial view of your application here
    function getInitialView() {
        return [ new SwagginNumeralsView() ];
    }

}