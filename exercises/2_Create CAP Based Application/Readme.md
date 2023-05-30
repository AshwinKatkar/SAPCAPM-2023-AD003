
- [CAP Project Creation](#project)
- [Table Creation](#table)
- [Summary](#summary)


## CAP Project Creation<a name="project"></a>

1. After Creating Dev Space You’ll be redirected to your newly created SAP Business Application Studio Dev Space. Click on <b>Start Template</b> as shown below.  <br>![Start Template](images/08.png)<br>

2. Select <b>CAP Project</b> from given template and click on <b>Start.</b><br>![Start Template](images/10.png)<br>

3. Enter your Project name as shown below, and choose <b>Node.js</b> from runtime.<br>
Select all check boxes given below and click on <b>Finish</b> button.<br>![Start Template](images/11.png)<br>

## CAP Table Creation<a name="table"></a>

1. Now, to create a table go to <b>db</b> folder and click on <b>data-model.cds</b> here we can write code to create a table as shown in below <br>![Start Template](images/12.png)<br>, here we use entity keyword to create a table followed by table name Incident <br>
<br>
<p>
```namespace my.Incident_Management;
using {managed} from '@sap/cds/common';
entity Incidents : managed {
  key ID              : UUID; //@(Core.Computed : true);
      title           : String(50);
      category        : String(50);
      priority        : String(50);
      Incident_Status : String(50);
      location        : String(50);
      observation     : String(50);
      Address         : String(100);
      Date_Time       : DateTime @cds.on.insert: $now;

```
}<br>
</p><br>

## Summary <a name="summary"></a>

You have now successfully installed and configured your Desktop Agent 3.

Continue to - [Exercise 3 - Import Sample Process from SAP Build Process Automation Store](../3_ImportSampleProcess/Readme.md)