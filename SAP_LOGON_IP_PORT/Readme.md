## How to locate IP address and Port details in SAP GUI backend

</br></br>

when Ip address and Port details are not available in sap logon pad due to security resasons an alternative way to identify these details is shown below 
</br></br>

**Ip address :**
</br></br>

 
- goto tcode OS01 
- select **"application server"** button
- if application server and IP address is not shown - select **"change view"** 
- this should show the Ip address details  
- Alternative way Tcode - SE37 : Function Module : RFC_HOST_TO_IP
- Function Module : RFC_IP_TO_HOST for finding Host name wiht IP address
  
</br></br>
</br>

**Port :**
</br></br>

 
- goto tcode SMICM 
- select menu goto-->services
- Alternative way Tcode - SE37 : Function Module : ICM_GET_INFO
