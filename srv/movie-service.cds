using { sap.movie as mv } from '../db/schema';

service MovieService @(path: '/movie') { 


  entity Movies as select from mv.Movies {
    *
  } excluding { modifiedAt, modifiedBy, createdAt, createdBy } 
  ;

//   entity MVStatus( MvStatus: mv.Status)
//    as select * from Movies where status=:MvStatus;
  
  entity Employee as projection on mv.Employee;
  entity Locations as projection on mv.Locations;
  entity Posts     as projection on mv.Post;
  entity Scenes    as projection on mv.Scenes;
  entity Property  as projection on mv.Property;
  entity Staff     as projection on mv.Staff;
  entity Booking   as projection on mv.Booking;

  action pushMovieStatus( movieID: Movies:ID ) returns { message: String; };

}

// annotate MovieService.Movies with @odata.draft.enabled; 