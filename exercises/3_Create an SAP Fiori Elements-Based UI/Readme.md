## Table of Contents
 - [Overview](#section1)
 - [Create an SAP Fiori Elements-Based UI](#section2)
 - [Summary](#summary)


### Overview <a name="section1"></a>

In this exercise, we will create UI from local CAP project for SAP Fiori Element.

 ![Login Page](/exercises/1_Setup%20BAS%20and%20Create%20SPACE/images/FinalOverview.png)

## Create an SAP Fiori Elements-Based UI <a name="section2"></a>

1. For Creating <b>SAP Fiori Elements-Based UI </b> click on menu tab as shown in below.<br>
then select <b>View </b> from menu and then select <b>Command Palatte. </b><br><br>![Image](./images/01.png)

2. Then search for <b> Application Generator </b>and select <b> Fiori:Open Application Generator </b><br>
<br>![Image](./images/02.png)

3. Now Template Wizard open.<br>
Select <b>List Report Page.</b> and click on<b> Next Button.</b>  <br><br>![Image](./images/03.png)

4. Select Data Source as <b>Use a Local CAP Project</b>
Choose your CAP Project which you have created earlier.
Then select oData Service and click on <b>Next</b> button.<br>
<br>![Image](./images/04.png)

5. Select your main entity which you want to show in list page.<br>
Click on <b>Next</b> button.
<br><br>![Image](./images/05.png)

6. Give module name as your project name.
note : module name should be in small letter and without space.
Give a Application Title. Also give application name if you want
Choose radio button as shown in below.
Click on <b>Next</b> button.
<br><br>![Image](./images/06.png)<br><br>

- For deployment configuration of MTA project choose "<b>Yes</b>"
- For adding FLP Configuration choose "<b>Yes</b>" otherwise you can choose "<b>No</b>"
- We don't require advance configuration so choose "<b>No</b>"
<br><br>![Image](./images/07.png)

7. Choose the target as <b>Cloud Foundry</b> for your deployment configuration.<br>
Select Destination name which you have created, and click on <b>Next</b> button.
<br><br>![Image](./images/08.png)

8. Give semantic object Give <b>manage</b> in Action field. Give <b> Application title</b> in title field. And subtitle is optional you give if you want.
click on <b>Finish button.</b>
<br><br>![Image](./images/09.png)

8. Now <b>SAP Fiori Elements-Based UI</b> is created.
Then, Select <b>Preview Application</b>.
Then you will get pop-up message, click on <b>Open in new Tab</b> as shown in below.
<br><br>![Image](./images/13.png)
<br>

 9. <b>SAP Fiori Elements-Based UI</b> is ready. 
<br><br>

 ![Login Page](/exercises/1_Setup%20BAS%20and%20Create%20SPACE/images/FinalOverview.png)


## Summary<a name="summary"></a>

You have now acquired <b>SAP Fiori Elements-Based UI</b>.

Continue to - [Exercise 4 - Enhance the Fiori Element Application.](../4_Enhance%20the%20Fiori%20Element%20Application%20with%20annotation/Readme.md)
