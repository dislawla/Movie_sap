using { sap.movie as mv } from '../db/schema';

service AdminService @(path: '/admin') { 

  entity Locations as projection on mv.Locations 

  entity Post    as projection on mv.Post;
  entity Property  as projection on mv.Property;

}

// annotate AdminService.Post with @odata.draft.enabled; 