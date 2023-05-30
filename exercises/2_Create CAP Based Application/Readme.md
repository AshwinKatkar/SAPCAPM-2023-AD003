
- [CAP Project Creation](#project)
- [Table Creation](#table)
- [Summary](#summary)


## CAP Project Creation<a name="project"></a>

1. After Creating Dev Space You’ll be redirected to your newly created SAP Business Application Studio Dev Space. Click on <b>Start Template</b> as shown below.  <br>![Start Template](images/08.png)<br>

2. Select <b>CAP Project</b> from given template and click on <b>Start.</b><br>![Start Template](images/10.png)<br>

3. Enter your Project name as shown below, and choose <b>Node.js</b> from runtime.<br>
Select all check boxes given below and click on <b>Finish</b> button.<br>![Start Template](images/11.png)<br>

## CAP Table Creation<a name="table"></a>

1. Now, to create a table go to <b>db</b> folder and click on <b>data-model.cds</b> here we can write code to create a table as shown in below <br><br>![Start Template](images/12.png)<br>, here we use entity keyword to create a table followed by table name Incident <br>
<br>

```
namespace my.Incident_Management;
using {managed} from '@sap/cds/common';
entity Incidents : managed {
  key ID              : UUID;
      title           : String(50);
      category        : String(50);
      priority        : String(50);
      Incident_Status : String(50);
      location        : String(50);
      observation     : String(50);
      Address         : String(100);
      Date_Time       : DateTime @cds.on.insert: $now;
}

```
<br>

2. Now, to expose <b>Incident</b> table to services we have to do projection of tables for which,
Go to <b>srv</b> folder and click on <b>cat-service.cds</b> and write the following code <br><br>![Start Template](images/13.png)<br>

```
using my.Incident_Management as ims from '../db/data-model';
service CatalogService {
    entity Incidents     as projection on ims.Incidents;
    annotate Incidents with @odata.draft.enabled;
}

```
<br>

3.  Click on Project name create <b>i18n</b> folder <br><br>![Start Template](images/13.png)<br>

4. Inside folder create <b>i8n.properties</b> file and write code as shown below <br><br>![Start Template](images/15.png)<br>
```
#Common Fields
#XFLD: Label
ID  = Incident ID 
#XFLD: Label
title = Title
#XFLD: Label
category = Category 
#XFLD: Label
priority = Priority
#XFLD: Label
Incident_Status = Status
#XFLD: Label
location = Location
#XFLD: Label
observation = Is Observed?
#XFLD: Label
Address = Address
#XFLD: Label
Date_Time = Date Time

```
<br>

5. Create <b>cat-service.annotation.cds</b> file inside <b>srv</b> folder and write code as shown below <br><br>![Start Template](images/16.png)<br>

```
using CatalogService from './cat-service';

annotate CatalogService.Incidents with {
    ID              @title : '{i18n>ID}';
    title           @title : '{i18n>title}';
    category        @title : '{i18n>category}';
    priority        @title : '{i18n>priority}';
    Incident_Status @title : '{i18n>Incident_Status}';
    location        @title : '{i18n>location}';
    observation     @title : '{i18n>observation}';
    Address         @title : '{i18n>Address}';
    Date_Time       @title : '{i18n>Date_Time}';
};

annotate CatalogService.Incidents with @(
    sap.searchable         : false,

    UI.HeaderInfo          : {
        TypeName       : 'Incidents List',
        TypeNamePlural : 'Incidents List',
    //  Title          : {Value : PsplInvoice}
    },
    UI.SelectionFields     : [
        category,
        priority ,
        Incident_Status,
        location
    ],
    UI.PresentationVariant : {SortOrder : [{
        $Type      : 'Common.SortOrderType',
        Property   : 'Date_Time',
        Descending : true
    }]},
    UI.LineItem            : [
        // {
        //     $Type : 'UI.DataField',
        //     Value : ID,
        // },
        {
            $Type : 'UI.DataField',
            Value : title
        },
        {
            $Type : 'UI.DataField',
            Value : category
        },
        {
            $Type : 'UI.DataField',
            Value : priority
        },
        {
            $Type : 'UI.DataField',
            Value : Incident_Status
        },
        {
            $Type : 'UI.DataField',
            Value : location
        },
        {
            $Type : 'UI.DataField',
            Value : observation
        },
        {
            $Type : 'UI.DataField',
            Value : Address
        },
        {
            $Type : 'UI.DataField',
            Value : Date_Time
        }


    ],
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Value : category,
            },
            {
                $Type : 'UI.DataField',
                Value : priority,
            },
            {
                $Type : 'UI.DataField',
                Value : Incident_Status,
            },
            {
                $Type : 'UI.DataField',
                Value : location,
            },
            {
                $Type : 'UI.DataField',
                Value : observation,
            },
            {
                $Type : 'UI.DataField',
                Value : Address,
            },
            {
                $Type : 'UI.DataField',
                Value : Date_Time,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);

```




## Summary <a name="summary"></a>

You have now successfully installed and configured your Desktop Agent 3.

Continue to - [Exercise 3 - Import Sample Process from SAP Build Process Automation Store](../3_ImportSampleProcess/Readme.md)
