sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'contractmanager/test/integration/FirstJourney',
		'contractmanager/test/integration/pages/ContractsList',
		'contractmanager/test/integration/pages/ContractsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ContractsList, ContractsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('contractmanager') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheContractsList: ContractsList,
					onTheContractsObjectPage: ContractsObjectPage
                }
            },
            opaJourney.run
        );
    }
);