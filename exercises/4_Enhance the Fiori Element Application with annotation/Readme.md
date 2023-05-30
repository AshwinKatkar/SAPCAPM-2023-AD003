## Table of Contents
 - [Overview](#overview)
 - [Create Destination](#destination)
 - [Create SAP Fiori Application](#FioriApp)


 - [Summary](#summary)

### Overview <a name="overview"></a>

In this exercise you will learn:

- How to create destination to consume CAPM service.
- How to Create SAP Fiori Application.


## Create Destination <a name="destination"></a>

1. For Consuming CAPM service we need to create destination> click on given link <br>
-   [- Click here](https://emea.cockpit.btp.cloud.sap/cockpit/#/globalaccount/af288739-c527-4b65-b66d-0ed5e4010878/subaccount/d8241bf3-e68c-436e-a074-ced1e90d59ed/subaccountoverview)
<br>

2. Click on <b>Connevtivity</b> and select <b>Destination</b> as given below<br><br>
    ![01](./images//01.png)

3. Click on <b>New Destination</b>.<br><br>
    ![02](./images//02.png)

4. Write IMS_Workshop in <b>Name</b> field. In type select <b>HTTP</b>. In <b>URL</b> field paste your CAPM project service link. Keep <b>Proxy Type</b> <b>Internet</b>, Authentication field select <b>No Authentication</b>.<br>
After this select <b>New Property</b>
- HTML5Dynamic Destination <b>-> true</b>
- WebIDEEnabled <b>-> true</b>
- WebIDEUsage <b>-> odata_gen</b>
Click on <b>Save </b>button.
<br><br>

![03](./images//03.png)


5. Click on <b>Check conection</b>
<br><br>

![03](./images//06.png)

6. We successfully created Destination, and click on <b>Close</b>.
<br><br>

![03](./images//07.png)

## Create SAP Fiori Application <a name="FioriApp"></a>

1. Go to your Bussiness Application Studio (BAS).

2. Select <b>Start from template.</b>
<br><br>

![03](./images//08.png)

2. Select <b>SAP Fiori Application</b> and click on <b>Start</b>.
<br><br>

![03](./images//04.png)

3. Select <b>List Report Page</b> and click on <b>Next</b>.
<br><br>

![03](./images//05.png)

4. Select <b>onnect to a system</b>in <b>Data Source</b>Select <b>IMS_Workshop</b>in <b>System</b>and write <b>/catlog</b> in <b>Service path</b> and click on <b>Next</b>.
<br><br>

![03](./images//05.png)

## Summary <a name="summary"></a>

You have now created API Triggers for the Business Process.

Continue to - [Exercise 5 - Modify the Automation](../5_ModifyAutomation/Readme.md)
