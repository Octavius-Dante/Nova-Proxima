### What is SAP GUI for HTML?

</br>
SAP GUI for HTML is a web-based interface that allows SAP transactions, traditionally run via SAP GUI, to be accessed from a web browser. It is part of SAP’s Internet Transaction Server (ITS), and it ensures that users can perform SAP transactions without needing a local SAP GUI installation.
</br></br>

### Key Benefits: 
</br>

- No client installation: Users can access SAP transactions via a browser.
- Cross-platform access: Supports different browsers and devices.
- Enhanced user experience: Can integrate with SAP Fiori for a more intuitive interface.

</br></br>

### Converting ABAP Tcode into a Web App Using SAP GUI for HTML </br>
To convert an existing ABAP Tcode into a web-based application using SAP GUI for HTML, follow these steps:

</br></br>

### Step 1: Ensure ITS is Active </br>
The Internet Transaction Server (ITS) must be set up and active in your system for the conversion to work.
</br>
### Check ITS Setup: 
</br>
- Go to transaction SICF and ensure the ITS-related services are active. 
- Navigate to the path: default_host -> sap -> bc -> gui -> sap -> its -> webgui. 
- If it’s not active, right-click and select "Activate Service." 


</br></br>

### Step 2: Test the SAP GUI for HTML </br>
Before proceeding with the conversion, it's essential to verify that the SAP GUI for HTML is functioning.
</br>
Use the following URL format to access the SAP GUI for HTML from a browser:
</br>

```

http://<your_sap_system>:<port>/sap/bc/gui/sap/its/webgui

```

To know the sap system and port details you can try following 2 methods

- visit this tcode in GUI : SMICM and access menu (Goto -> Services) and check HTTPS protocol entry
- NWBC tcode and check the URL section of the browser which popsup
