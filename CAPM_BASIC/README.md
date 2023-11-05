## Cloud application programming model


**Pre-requisities before app deployment**

- [x] App should have manifest.yml file 
- [x] App should have main file 
- [x] then app file respective language *.go , *.js *. etc 

</br>


**Manifest file should have - following components :**

- [x] App name 
- [x] App memeory size 
- [x] Instance number 
- [x] Then URL to be involved in the app execution
> (custom -defined url  or default cloud based url) // recommended -let cloud application to decide the url.

</br>
</br>

## Commands involved in general & app deployment activities : 


1. Logging In
   </br>
   ```bat
   cf login
   ```
   </br>
   </br>
    <img src="./files/1-cf_login.png" >
   </br>
   </br>
1. Checking the available buildpacks in the cloud environment 
2. Cloning Git hub repositiory link to lcoal directory 
3. Deploying app to cloud 
4. Checking list of available apps in cloud (deployed)
5. Checking log status for a specific app 


