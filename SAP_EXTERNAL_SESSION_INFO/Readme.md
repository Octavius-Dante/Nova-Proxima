## External Session information in the title of the SAP TRANSACTION

</BR>

1. Create "SAP\SAP GUI\" Directories in my documents
2. Place the "ESession.txt" file from *.zip file.


</BR>

### ESession.txt file contains the following script

</BR>

```script

set V[test] "&"
TitlePrefix "SAP &V[test][_database]/&V[test][_client] User &V[test][_user] &V[test]V[_transaction] :"


```
