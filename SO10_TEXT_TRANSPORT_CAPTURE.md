STEPS FOR ADDING SO10 TEXT TO TRANSPORT

1. Make changes to SO10 text object (note down the text object name). 
2. Go to SE09 or SE10 tcode for transport request handling.
3. select the Transport request and select the Task. 
4. Go to menu and select - Request Task--->Change Type--->Development / Correction
5. Copy the Transport Task number.
6. Go to SE38 Tcode and execute the program : RSTXTRAN .
7. Enter the Transport task number to (Name of Correction/Repair) field
8. Make sure Right (Text key ID -- Text key language) is entered in the selection screen.
9. Execute the program and it will list down all the SO10 text objects. 
10. Click "Deselect all" button on top, Scroll down and locate your text object and seelct the checkbox.
11. After seelcting your text objects press enter key in keyboard.
12. Next screen appears select button (Trsfr texts to corr.) this will show a pop up (do you want to add the text to correction) select yes.

13. Text object will be added to transport task, now goto SE09/SE10 transactio and locate the Transport request and transport task and validate it. 
