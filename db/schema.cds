namespace sap.movie; 

using {  
        cuid,
        managed,
        Country,
} from '@sap/cds/common';

type Location: Association to Locations;

aspect EmployeeName  {
    firstName : String @mandatory ;
    lastName  : String @mandatory ;
}



entity Movies : cuid, managed {
  title : localized String @mandatory ;
  staff : Association to many Staff on staff.movie = $self @cds.autoexpose;
  scene: Association to many Scenes on scene.movie = $self @cds.autoexpose;
  location: Location @cds.autoexpose;
  status : Status @mandatory @default : 0;

}

entity Scenes: cuid, managed {
    title: String @mandatory ;
    movie: Association to Movies @mandatory @assert.target;
    location: Location;
}

entity Locations: cuid, managed {
    country: Country;
    title: String @mandatory;
    property: Association to many Property on property.location = $self;
}

entity Property: cuid, managed{
    type: Proptype; 
    title: String;  
    location: Location @mandatory @assert.target;
}

type Proptype: Integer enum{
    warehouse = 0;
    room = 1;
    house = 2;
}

entity Staff:cuid, managed, EmployeeName {
    movie: Association to Movies;
    post: Association to Post;
    booking:Association to many Booking on booking.staff = $self;
}

entity Post: cuid, managed{
title:String;
}

entity Booking: cuid, managed{
    title: String @mandatory ;
    dateFrom: Date;
    dateTo: Date;
    Property: Association to Property;
    staff:Association to Staff;
}


type Status: Integer enum{
    Concept = 0;
    Production = 1;
    Postproduction = 2;
    Released = 3;
}