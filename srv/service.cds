using { contractManagement } from '../db/schema.cds';

service contractManagementSrv {
  @odata.draft.enabled
  entity Contracts as projection on contractManagement.Contracts;
  entity Customers as projection on contractManagement.Customers;
}