## Table of Contents
- [Overview](#section1)
- [CAP Project Creation](#project)
- [Table Creation](#table)
- [Install dependencies](#install)
- [ Database connection and project deployment](#db)
- [Summary](#summary)

### Overview <a name="section1"></a>

In this exercise, you will learn:
- How to setup Project in CAP.
- How to Create tables in data-model file
- How to give projection of created tables in cat-service.cds file 
- How to install dependencies for project
- How to connect database to to project
- How to build and deploy our project to cloud. 

 <br>![Start Template](images/exc2/23.png)


## CAP Project Creation<a name="project"></a>

1. After Creating Dev Space You’ll be redirected to your newly created SAP Business Application Studio Dev Space. Click on <b>Start Template</b> as shown below. <br><br>![Start Template](images/08.png)<br>

2. Select <b>CAP Project</b> from given template and click on <b>Start.</b> <br><br>![Start Template](images/10.png)<br>

3. Enter your Project name as shown below, and choose <b>Node.js</b> from runtime.<br>
Select all check boxes given below and click on <b>Finish</b> button. <br><br>![Start Template](images/exc2/1.png)<br>

3.Now we have  Sucessfully Created a CAP Project <br><br>![Start Template](images/exc2/2.png)<br>

## CAP Table Creation<a name="table"></a>

1. Now, to create a table go to <b>db</b> folder and click on <b>data-model.cds</b> replace the code and you can refer below code to create a table as shown in below, here we use <b>entity<b> keyword to create a table followed by table name Incident <br><br>![Start Template](images/exc2/3.png)<br> 

```
namespace my.Incident_Management;

using {managed} from '@sap/cds/common';

entity Incidents : managed {
    key ID          : UUID; //@(Core.Computed : true);
        title       : String(50);
        category    : Association to one category;
        Priority    : Association to one Priority;
        Status      : Association to one Status;
        Location    : Association to one location;
        Observation : Association to one observation;
        Address     : String(100);
        Date_Time   : DateTime @cds.on.insert: $now;
};

entity Status {
    key ID    : Integer;
        SName : String(50);
};

entity Priority {
    key ID    : Integer;
        PName : String(50);
};

entity category {
    key ID    : Integer;
        CName : String(50);
};

entity location {
    key ID    : Integer;
        LName : String(50);
};

entity observation {
    key ID    : Integer;
        OName : String(50);
};
```
<br>

2. Now, to expose <b>Incident</b> table to services we have to do projection of tables for which,
Go to <b>srv</b> folder and click on <b>cat-service.cds</b> and replace previous code with below code as shown below <br><br>![Start Template](images/exc2/4.png)<br>

```
using my.Incident_Management as ims from '../db/data-model';

service CatalogService {

entity Incidents as projection on ims.Incidents; 
annotate Incidents with @odata.draft.enabled;
@odata.draft.enabled
entity Status as projection on ims.Status;
@odata.draft.enabled
entity Priority as projection on ims.Priority;
@odata.draft.enabled
entity location as projection on ims.location;
@odata.draft.enabled
entity category as projection on ims.category;
@odata.draft.enabled
entity observation as projection on ims.observation;
}


```
<br>


## Install dependencies <a name="install"></a>

1. Right Click on IMS_Fullstack, select <b>Open in integrated Terminal</b> <br><br>![Start Template](images/exc2/5.png)<br><br>

2. The terminal will open in the bottom right of the Business Application studio run  <b>"cf login --sso"</b>  command and press enter  then Temporary Authentication Code link will be generated as shown below  Ctrl+Click on following link    <br>

```
cf login --sso

```
 <br>![Start Template](images/exc2/27_1.png)<br><br>

3. After that you will get pop up of <strong> Do you want SAP Business Application Studio to open the external website</strong>then Click on <b>Open</b>

<br>![Start Template](images/exc2/28.png)<br><br>

4. Now you will redirect to  <b>SAP Business Technology Platform identity provider page </b><br><br> ![Start Template](images/exc2/29.png)<br><br>

5. Copy this origin key <b>"a6808008-platform"</b> and paste in <b>Enter the origin key of your Identity provider</b> field and press enter<br>

```
a6808008-platform

```
<br>![Start Template](images/exc2/30.png)<br><br>

6. After that you will redirect to <b>Temporary Authentication Code</b> copy that code<br>

<br>  ![Start Template](images/exc2/31.png)<br><br>

7. Paste the generated Authentication Code as shown in below image <br>

<br>![Start Template](images/exc2/32.png)<br><br>

8.  Run <b>"npm install"</b> command and press enter <br>
 
```
npm install

```
<br>![Start Template](images/exc2/9.png)<br><br>

9.  After installation of npm packages run <b>"cds build/all"</b> command and press enter <br>

```
cds build/all

```
<br>  ![Start Template](images/exc2/10.png)<br><br>

10. After that run <b>"cds deploy --to" hana</b> command and press enter<br>

```
cds deploy --to hana

```
<br>![Start Template](images/exc2/11.png)<br><br>

## Database connection and project deployment <a name="db"></a>

1. Click on highlighted section and select <b>Run Configuration</b> <br><br>![Start Template](images/exc2/12.png)<br>

2. Click on <b>Create Configuration</b> <br><br>![Start Template](images/exc2/13.png)<br>

3. After that you will get pop up <b>IMS_Fullstack-development profile (CAP)</b>Click on that and press enter.<br><br>![Start Template](images/exc2/14.png)<br>

4. Click on <b>Run IMS_Fullstack</b> and press enter.<br><br>![Start Template](images/exc2/15.png)<br>

5. Now you can able to see Created Database Configuration open that folder and Click on  highlighted section in <b>db-hana</b> as shown in below <br><br>![Start Template](images/exc2/16.png)<br>

6. You will get pop up Click on <b>IMS_Fullstack-db hana(hdi-shared)</b> <br><br>![Start Template](images/exc2/17.png)<br>

7. Click on <b>Yes</b> <br><br>![Start Template](images/exc2/18.png)<br>

8. Now you are successfuly conected to  <b>Hana Database</b> <br><br>![Start Template](images/exc2/19.png)<br>

9. <b>Click</b> on the highlighted part as shown in below<br><br>![Start Template](images/exc2/26.png)<br>

10. On left side you can able to see <b>mta.yml</b> file right click on that and select <b>Built MTA Project</b> <br><br>![Start Template](images/exc2/20.png)<br> <br> ![Start Template](images/exc2/25.png)

11. Afer completion of <b>Built MTA Project</b> <b>mta archives</b> folder will be generated open <b>mta archives</b> inside that <b>Project_name.mtar</b> file able to see  right click on that and select <b>Deploy MTA Archive</b> <br><br>
![Start Template](images/exc2/21.png)<br><br>

12. After Deployment of project you will get service link as shown in below<br><br>![Start Template](images/exc2/24.png)<br>

13. Copy Service link and paste in new tab of browser and press enter.  <br><br>![Start Template](images/exc2/23.png)<br>

## Summary <a name="summary"></a>

You have now successfully Created SAP BTP CAP project .

Continue to - [Exercise 3 -3_Create an SAP Fiori Elements-Based UI ](../3_Create%20an%20SAP%20Fiori%20Elements-Based%20UI/Readme.md) 