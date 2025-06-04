using { sap.movie as mv } from '../db/schema';

service MovieService @(path: '/movie') { 

  entity Movies    as projection on mv.Movies;
  entity Locations as projection on mv.Locations;
  entity Posts     as projection on mv.Post;
  entity Scenes    as projection on mv.Scenes;
  entity Property  as projection on mv.Property;
  entity Staff     as projection on mv.Staff;
  entity Booking   as projection on mv.Booking;
}

annotate MovieService.Movies with @odata.draft.enabled; 