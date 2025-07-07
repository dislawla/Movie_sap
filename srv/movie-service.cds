using { sap.movie as mv } from '../db/schema';

type Criticality: Integer enum{
    Red = 1;
    Yellow = 2;
    Green = 3;
    Test = 4;
};

service MovieService @(path: '/movie') { 
  entity Movies as select from mv.Movies {
    *,
    virtual crit: Criticality,
    virtual stattxt:String
  } excluding { modifiedAt, modifiedBy, createdAt, createdBy } 
  ;

  entity MVStatus( MvStatus: mv.Status)
   as select from Movies { * } excluding { staff, scene } where status=:MvStatus ;

  @cds.redirection.target
  entity Employee as projection on mv.Employee;
  entity Locations as projection on mv.Locations;
  entity Posts     as projection on mv.Post;
  entity Scenes    as projection on mv.Scenes;
  entity Property  as projection on mv.Property;
  entity Staff     as projection on mv.Staff;
  entity Booking   as projection on mv.Booking;

  entity EmployNames as projection on mv.EmployName;

  action pushMovieStatus( movieID: Movies:ID ) returns { message: String; };

  function getActorsCount (movieID: Movies:ID ) returns Integer;

  function getMoviesByStatus( status: Movies:status) returns many Movies;

  function sleep() returns Boolean;
}