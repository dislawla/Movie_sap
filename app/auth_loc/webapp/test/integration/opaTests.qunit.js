sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ns/authloc/test/integration/FirstJourney',
		'ns/authloc/test/integration/pages/LocationsList',
		'ns/authloc/test/integration/pages/LocationsObjectPage'
    ],
    function(JourneyRunner, opaJourney, LocationsList, LocationsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ns/authloc') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheLocationsList: LocationsList,
					onTheLocationsObjectPage: LocationsObjectPage
                }
            },
            opaJourney.run
        );
    }
);