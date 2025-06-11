using { sap.common.CodeList } from '@sap/cds/common';

namespace contractManagement;

entity ContractsContractTypeCodeList : CodeList {
  @Common.Text : { $value: name, ![@UI.TextArrangement]: #TextOnly }
  key code : String(50);
}

entity ContractsStatusCodeList : CodeList {
  @Common.Text : { $value: name, ![@UI.TextArrangement]: #TextOnly }
  key code : String(50);
  criticality : Integer;
}

entity Contracts {
  key ID: UUID;
  contractID: String(50) @assert.unique @mandatory;
  contractType: Association to ContractsContractTypeCodeList;
  startDate: Date;
  endDate: Date;
  status: Association to ContractsStatusCodeList;
  Customers: Association to many Customers on Customers.contracts = $self;
}

entity Customers {
  key ID: UUID;
  name: String(100);
  identificationNumber: String(50) @assert.unique @mandatory;
  address: String(200);
  contactInformation: String(100);
  contracts: Association to Contracts;
}
