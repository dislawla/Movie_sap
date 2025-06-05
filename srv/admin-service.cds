using { sap.movie as mv } from '../db/schema';

service AdminService @(path: '/admin') { 

  entity Locations as projection on mv.Locations;
  entity Posts     as projection on mv.Post;
  entity Property  as projection on mv.Property;

}

annotate AdminService.Posts with @odata.draft.enabled; 