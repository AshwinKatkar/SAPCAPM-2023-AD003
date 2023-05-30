namespace my.Incident_Management;

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
}
