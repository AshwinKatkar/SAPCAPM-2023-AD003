## Table of Contents
 - [Overview](#overview)
 - [Create Annotation in CAP ](#annotation)
 - [Create SAP Fiori Application](#FioriApp)


 - [Summary](#summary)

### Overview <a name="overview"></a>

In this exercise you will learn:

- How to Create SAP Fiori Application.

### Create annotation in CAP Project <a name="annotation"></a>

1.  To Create annotation click on <b>Project name</b> create <b>i18n</b> folder <br><br>![Start Template](../2_Create%20CAP%20Based%20Application/images/14.png)<br>

2. Inside folder create <b>i8n.properties</b> file and write code as shown in below <br><br>![Start Template](../2_Create%20CAP%20Based%20Application/images/15.png)<br>

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

3. Create <b>cat-service.annotation.cds</b> file inside  <b>srv</b>  folder and write code as shown below <br><br>![Start Template](../2_Create%20CAP%20Based%20Application/images/16.png)<br>

```
using CatalogService from './cat-service';
using from '@sap/cds/common';

annotate CatalogService.Incidents with {
    ID          @title: '{i18n>ID}';
    title       @title: '{i18n>title}';
    category    @title: '{i18n>category}';
    Priority    @title: '{i18n>priority}';
    Status      @title: '{i18n>Incident_Status}';
    location    @title: '{i18n>location}';
    observation @title: '{i18n>observation}';
    Address     @title: '{i18n>Address}';
    Date_Time   @title: '{i18n>Date_Time}';
};

annotate CatalogService.Incidents with @(
    sap.searchable                : false,

    UI.HeaderInfo                 : {
        TypeName      : 'Incidents List',
        TypeNamePlural: 'Incidents List',
    //  Title          : {Value : PsplInvoice}
    },
    UI.SelectionFields            : [
        category_ID,
        Priority_ID,
        Status_ID,
        location_ID
    ],
    UI.PresentationVariant        : {SortOrder: [{
        $Type     : 'Common.SortOrderType',
        Property  : 'Date_Time',
        Descending: true
    }]},
    UI.LineItem                   : [
        // {
        //     $Type : 'UI.DataField',
        //     Value : ID,
        // },
        {
            $Type: 'UI.DataField',
            Value: title
        },
        {
            $Type: 'UI.DataField',
            Value: category_ID
        },
        {
            $Type: 'UI.DataField',
            Value: Priority_ID
        },
        {
            $Type: 'UI.DataField',
            Value: Status_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: location_ID
        },
        {
            $Type: 'UI.DataField',
            Value: observation_ID
        },
        {
            $Type: 'UI.DataField',
            Value: Address
        },
        {
            $Type: 'UI.DataField',
            Value: Date_Time
        }


    ],
    UI.FieldGroup #GeneratedGroup1: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: ID,
            },
            {
                $Type: 'UI.DataField',
                Value: title,
            },
            {
                $Type: 'UI.DataField',
                Value: category_ID,
            },
            {
                $Type: 'UI.DataField',
                Value: Priority_ID,
            },
            {
                $Type: 'UI.DataField',
                Value: Status_ID
            },
            {
                $Type: 'UI.DataField',
                Value: location_ID,
            },
            {
                $Type: 'UI.DataField',
                Value: observation_ID,
            },
            {
                $Type: 'UI.DataField',
                Value: Address,
            },
            {
                $Type: 'UI.DataField',
                Value: Date_Time,
            },
        ],
    },
    UI.Facets                     : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneratedGroup1',
    }, ]
);

annotate CatalogService.Incidents with {
    Status @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Status',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: Status_ID,
                    ValueListProperty: 'ID',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'SName',
                }
            ],
        },


        Common.ValueListWithFixedValues: true
    )
};

annotate CatalogService.Status with {
    ID @Common.Text: {
        $value                : SName,
        ![@UI.TextArrangement]: #TextOnly,
    }
};

annotate CatalogService.Incidents with {
    Status @Common.Text: {
        $value                : Status.SName,
        ![@UI.TextArrangement]: #TextOnly,
    }
};

annotate CatalogService.Incidents with {
    Priority @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Priority',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: Priority_ID,
                    ValueListProperty: 'ID',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'PName',
                }
            ],
        },


        Common.ValueListWithFixedValues: true
    )
};

annotate CatalogService.Priority with {
    ID @Common.Text: {
        $value                : PName,
        ![@UI.TextArrangement]: #TextOnly,
    }
};

annotate CatalogService.Incidents with {
    Priority @Common.Text: {
        $value                : Priority.PName,
        ![@UI.TextArrangement]: #TextOnly,
    }
};

annotate CatalogService.Incidents with {
    location @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'location',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: location_ID,
                    ValueListProperty: 'ID',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'LName',
                }
            ],
        },


        Common.ValueListWithFixedValues: true
    )
};

annotate CatalogService.location with {
    ID @Common.Text: {
        $value                : LName,
        ![@UI.TextArrangement]: #TextOnly,
    }
};

annotate CatalogService.Incidents with {
    location @Common.Text: {
        $value                : location.LName,
        ![@UI.TextArrangement]: #TextOnly,
    }
};

annotate CatalogService.Incidents with {
    category @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'category',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: category_ID,
                    ValueListProperty: 'ID',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'CName',
                }
            ],
        },


        Common.ValueListWithFixedValues: true
    )
};

annotate CatalogService.category with {
    ID @Common.Text: {
        $value                : CName,
        ![@UI.TextArrangement]: #TextOnly,
    }
};

annotate CatalogService.Incidents with {
    category @Common.Text: {
        $value                : category.CName,
        ![@UI.TextArrangement]: #TextOnly,
    }
};

annotate CatalogService.Incidents with {
    observation @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'observation',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: observation_ID,
                    ValueListProperty: 'ID',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'OName',
                }
            ],
        },


        Common.ValueListWithFixedValues: true
    )
};

annotate CatalogService.observation with {
    ID @Common.Text: {
        $value                : OName,
        ![@UI.TextArrangement]: #TextOnly,
    }
};

annotate CatalogService.Incidents with {
    observation @Common.Text: {
        $value                : observation.OName,
        ![@UI.TextArrangement]: #TextOnly,
    }
};

```
<br>

4. Right Click on Project Name, select <b>Open in integrated Terminal</b> <br><br>
![Start Template](../2_Create%20CAP%20Based%20Application/images/17.png)<br>

5. Run <b>cds build/all</b> command and press enter 

```
cds build/all

```

6. Run <b>cds deploy --to hana</b> command and press enter 

```
cds deploy --to hana

```

7. Right click on <b>mta.yml</b> file  and select <b>Built MTA Project</b> <br><br>
![Start Template](../2_Create%20CAP%20Based%20Application/images/26.png)<br> <br><br>![Start Template](../2_Create%20CAP%20Based%20Application/images/27.png)<br> 

8. Open <b>mta archives</b> folder inside that <b>Project_name.mtar</b> file able to see  right click on that and select <b>Deploy MTA Archive</b> <br><br>
![Start Template](../2_Create%20CAP%20Based%20Application/images/28.png)<br> <br><br>![Start Template](../2_Create%20CAP%20Based%20Application/images/29.png)<br> 

## Create SAP Fiori Application <a name="FioriApp"></a>

1. Go to your Bussiness Application Studio (BAS). and click on menu icon.
<br>

![03](./images//18.png)

After that you can select <b> Help </b> and then select <b> Get Started </b> 
<br>
![03](./images//19.png)

2. Select <b>Start from template.</b>
<br>

![03](./images//08.png)

3. Select <b>SAP Fiori Application</b> and click on <b>Start</b>.
<br>

![03](./images//04.png)

4. Select <b>List Report Page</b> and click on <b>Next</b>.
<br><br>

![03](./images//05.png)

5. Select <b> Connect to a system </b> in <b> Data Source </b> Select <b> Your project </b> in <b> System</b> and Give <b> /catlog </b> in your <b> Service path</b> <br>
For example : https://crave-infotech-workshop-sap-build-9w562br3-dev-ims-full75303b83.cfapps.eu10-004.hana.ondemand.com/catalog/Incidents <b> /catalog </b> is your sevice path in above example. and click on <b>Next</b>.
<br>

![03](./images//09.png)

6. Select your main entity which you want to show in list page in <b>Main Entity</b> and click on <b>Next</b>.
<br>

![03](./images//10.png)

7.  Give module name as your project name.<b>Module name</b>.<br>
- note: Module name should be <b>lowercase</b> and without space.<br>
and choose the option as shown in below and click on <b>Next</b>.
<br>

![03](./images//11.png)
<br>
- For deployment configuration of MTA project choose "<b>Yes</b>"
- For adding FLP Configuration choose "<b>Yes</b>" otherwise you can choose "<b>No</b>"
- We don't require advance configuration so choose "<b>No</b>"

![03](./images//12.png)

8. Plese choose target as <b>Cloud Foundry</b> and choose destination as shown below and click on <b>Finish</b>.
<br>

![03](./images//13.png)

9. We successfully created <b>SAP Fiori Application</b>.<br>
Click on <b>Preview Application</b>.
<br>

![03](./images//15.png)

10. Select the <b>start-noflp fiori run</b> option from the list, as shown given below.
<br>

![03](./images//16.png)

11. Here we can see the  SAP Fiori Application. 
<br>

 ![Login Page](/exercises/1_Setup%20BAS%20and%20Create%20SPACE/images/FinalOverview.png)

## Summary <a name="summary"></a>

You have now created SAP Fiori Application using destination.