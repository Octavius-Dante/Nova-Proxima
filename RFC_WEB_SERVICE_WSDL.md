### how to create Web service in first place in SAP 

- Create a package 
- Create a Function group 
- Create a Function module - RFC type 
- Create Service definition as a WEb service using this RFC FM - utilities -> more utilities -> Create Web service -> From the function module 

### How to update the structure in the web services 

- Update the table type or structure  in the Function Module (import/export/ table)
- Now to update the WEB service (Service definition) go to se80 locate the web-service.service definition under - Enterprise services - Service definition - locate the service definition that yo uwant to make change
- Right click --> Consistency Check this will update the new structure includion and new field includion to the RFC FM
- Save and Activate the Web service service definition
