using { sap.movie as mv } from '../db/schema';

type Criticality: Integer enum{
    Red = 1;
    Yellow = 2;
    Green = 3;
};

service MovieService @(path: '/movie', requires : 'suport') { 

  entity Movies as select from mv.Movies {
    *,
    virtual crit: Criticality,
    virtual stattxt:String,
  } 
  // excluding { modifiedAt, modifiedBy, createdAt, createdBy }
  actions{
      @(Common.SideEffects : { TargetProperties : ['in/status_code','in/crit',] })
      // @(Core.OperationAvailable : { $edmJson: { $Eq: [{ $Path: 'in/IsActiveEntity'}, false]}})
    action pushMovieStatus() returns { message: String; }

      @(Common.SideEffects : { TargetProperties : ['in/status_code','in/crit'] })
    action backMovieStatus() returns { message: String; }
  } ;

  entity MVStatus( MvStatus: mv.Status)
   as select from Movies { * } excluding { staff, scene } where status.code=:MvStatus ;

  @cds.redirection.target
  entity Employee as select from mv.Employee{
    *
  };

  entity Locations as projection on mv.Locations;
  entity Posts     as projection on mv.Post;
  entity Scenes    as projection on mv.Scenes;
  entity Property  as projection on mv.Property;
  entity Staff     as projection on mv.Staff;
  entity Booking   as projection on mv.Booking;
  entity Status as projection on mv.MovieStatus;

  entity EmployNames as projection on mv.EmployName;

  function getActorsCount (movieID: Movies:ID ) returns Integer;

};

