using { contractManagementSrv } from '../../srv/service.cds';

annotate contractManagementSrv.Contracts with @UI.DataPoint #contractType: {
  Value: contractType_code,
  Title: 'Contract Type',
};
annotate contractManagementSrv.Contracts with @UI.DataPoint #startDate: {
  Value: startDate,
  Title: 'Start Date',
};
annotate contractManagementSrv.Contracts with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#contractType', ID: 'ContractType' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#startDate', ID: 'StartDate' }
];
annotate contractManagementSrv.Contracts with @UI.HeaderInfo: {
  TypeName: 'Contract',
  TypeNamePlural: 'Contracts',
  Title: { Value: contractID }
};
annotate contractManagementSrv.Contracts with {
  ID @UI.Hidden
};
annotate contractManagementSrv.Contracts with @UI.Identification: [{ Value: contractID }];
annotate contractManagementSrv.Contracts with {
  contractID @Common.Label: 'Contract ID';
  contractType @Common.Label: 'Contract Type';
  startDate @Common.Label: 'Start Date';
  endDate @Common.Label: 'End Date';
  status @Common.Label: 'Status';
  Customers @Common.Label: 'Customers'
};
annotate contractManagementSrv.Contracts with {
  ID @Common.Text: { $value: contractID, ![@UI.TextArrangement]: #TextOnly };
  contractType @Common.Text : { $value: contractType.name, ![@UI.TextArrangement]: #TextOnly };
  status @Common.Text : { $value: status.name, ![@UI.TextArrangement]: #TextOnly };
};
annotate contractManagementSrv.Contracts with {
  contractType @Common.ValueListWithFixedValues;
  status @Common.ValueListWithFixedValues;
};
annotate contractManagementSrv.Contracts with @UI.SelectionFields : [
 contractType_code,
 status_code,
 startDate
];
annotate contractManagementSrv.Contracts with @UI.LineItem #contractsTable: [
    { $Type: 'UI.DataField', Value: contractID },
    { $Type: 'UI.DataField', Value: Customers.name },
    { $Type: 'UI.DataField', Value: contractType_code },
    { $Type: 'UI.DataField', Value: startDate }
];
annotate contractManagementSrv.Contracts with @UI.SelectionPresentationVariant #contractsTable: {
  Text : 'Contracts',
  SelectionVariant : {
    SelectOptions : []
  },
  PresentationVariant : {
    Visualizations : ['@UI.LineItem#contractsTable']
  }
};
annotate contractManagementSrv.Contracts with @UI.LineItem #customersTable: [
    { $Type: 'UI.DataField', Value: Customers.name },
    { $Type: 'UI.DataField', Value: Customers.identificationNumber },
    { $Type: 'UI.DataField', Value: Customers.address },
    { $Type: 'UI.DataField', Value: Customers.contactInformation }
];
annotate contractManagementSrv.Contracts with @UI.SelectionPresentationVariant #customersTable: {
  Text : 'Customers',
  SelectionVariant : {
    SelectOptions : []
  },
  PresentationVariant : {
    Visualizations : ['@UI.LineItem#customersTable']
  }
};
annotate contractManagementSrv.Contracts with @UI.FieldGroup #contractDetailsSection: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: contractID },
    { $Type: 'UI.DataField', Value: contractType_code },
    { $Type: 'UI.DataField', Value: status_code, Criticality: status.criticality },
    { $Type: 'UI.DataField', Value: startDate },
    { $Type: 'UI.DataField', Value: endDate }

  ]
};


annotate contractManagementSrv.Customers with @UI.LineItem #customersSection: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: identificationNumber },
    { $Type: 'UI.DataField', Value: address },
    { $Type: 'UI.DataField', Value: contactInformation }

  ];


annotate contractManagementSrv.Contracts with @UI.Facets: [
  {
    $Type: 'UI.CollectionFacet',
    ID: 'contractDataTab',
    Label: 'Contract Data',
    Facets: [
      { $Type: 'UI.ReferenceFacet', ID: 'contractDetailsSection', Label: 'Contract Details', Target: '@UI.FieldGroup#contractDetailsSection' },
      { $Type: 'UI.ReferenceFacet', ID: 'customersSection', Label: 'Customers', Target: 'Customers/@UI.LineItem#customersSection' } ]
  }
];
annotate contractManagementSrv.Customers with {
  contracts @Common.ValueList: {
    CollectionPath: 'Contracts',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: contracts_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'contractID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'contractType_code'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'startDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'endDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'status_code'
      },
    ],
  }
};
annotate contractManagementSrv.Customers with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate contractManagementSrv.Customers with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name', ID: 'Name' }
];
annotate contractManagementSrv.Customers with @UI.HeaderInfo: {
  TypeName: 'Customer',
  TypeNamePlural: 'Customers',
  Title: { Value: identificationNumber }
};
annotate contractManagementSrv.Customers with {
  ID @UI.Hidden
};
annotate contractManagementSrv.Customers with @UI.Identification: [{ Value: identificationNumber }];
annotate contractManagementSrv.Customers with {
  name @Common.Label: 'Name';
  identificationNumber @Common.Label: 'Identification Number';
  address @Common.Label: 'Address';
  contactInformation @Common.Label: 'Contact Information';
  contracts @Common.Label: 'Contract'
};
annotate contractManagementSrv.Customers with {
  ID @Common.Text: { $value: identificationNumber, ![@UI.TextArrangement]: #TextOnly };
  contracts @Common.Text: { $value: contracts.contractID, ![@UI.TextArrangement]: #TextOnly };
};
annotate contractManagementSrv.Customers with @UI.SelectionFields: [
  contracts_ID
];
annotate contractManagementSrv.Customers with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: identificationNumber },
    { $Type: 'UI.DataField', Value: address },
    { $Type: 'UI.DataField', Value: contactInformation },
    { $Type: 'UI.DataField', Label: 'Contract', Value: contracts_ID }
];
annotate contractManagementSrv.Customers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: identificationNumber },
    { $Type: 'UI.DataField', Value: address },
    { $Type: 'UI.DataField', Value: contactInformation },
    { $Type: 'UI.DataField', Label: 'Contract', Value: contracts_ID }
]};
annotate contractManagementSrv.Customers with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];