@AbapCatalog.sqlViewName: 'ZCDS_X6_2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '# test 6 - CDS Case Char usage'
define view ZCDS_TEXT_X6_2 as select from snwd_employees
{
    
    client as Client,
    node_key as NodeKey,
    parent_key as ParentKey,
    employee_id as EmployeeId,
    first_name as FirstName,
    middle_name as MiddleName,
    last_name as LastName,

// for character data type blank space itself is a value so it wont work 
    case when middle_name is not null then middle_name 
    else last_name 
    end as M_NAME_CASE_1,

// for character data type blank should be checked as follows    
    case when middle_name <> ' ' then middle_name 
    else last_name 
    end as M_NAME_CASE_2
}
