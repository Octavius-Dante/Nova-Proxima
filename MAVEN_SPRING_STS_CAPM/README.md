# Maven & Spring Tool Suite - Starter guide

</br>
</br>
Maven is essential for managing the project with needed artifcats 
</br>
</br>

**Installation of MAVEN to system**

- [X] Prerequisite java installation Legacy sJava 8 (v1.8) is suficient for Maven as on Q4-2023 
- [X] Download the MAVEN file (extract in the needed Directory) https://maven.apache.org/download.cgi

</br>

**Installation of Spring tools suite to system**

- [X] Prerequisite java installation version 17 or greater needed for Spring tool suite as on Q4-2023 
- [X] Spring Tools Suite (STS) https://spring.io/tools

</br>

**(1) Maven download**
   </br>
   </br>
    <img src="./files/1-maven.png" >
   </br>
   </br>
   
**(2) Spring Tools suite for windows download - this is a modified verion of eclipse IDE**
   </br>
   </br>
    <img src="./files/2-sts.png" >
   </br>
   </br>
   
**(3) Post Spring STS extraction, increase the RAM allocation fpr STS by making changes to '*.ini file in STS directory**

- Change the values as mentioned in screenshot initiall it will be 512m or 256m , change it to 1G and 6G accordingly MB to GB allocation of RAM for this spring software.

   </br>
   </br>
    <img src="./files/3-sts.png" >
   </br>
   </br>
   </br>
   </br>

**(4) Extract Maven apache server file to a directory and set environmetn varialbes**

   </br>
   </br>
   <img src="./files/maven_path.png" >
   </br>
   </br>
   </br>
   </br>

   </br>
   </br>
   <img src="./files/env_variables.png" >
   </br>
   </br>
   </br>
   </br>

   
# Starting spring tool suite : Troubleshooting issues

</br>

- [x] **LSP (Spring boot language server) error when you launch Spring STS.**
  
   </br>
   
*Problem :*
   </br>
   </br>
    <img src="./files/sts_error_1.jpg" >
   </br>
   </br>
   </br>
      
*Solution : Change the active provider from (Native) to (Direct)*
   </br>
   </br>
    <img src="./files/sts_error_fix.jpg" >
   </br>
   </br>
