namespace sap.movie; 

using {  
        cuid,
        managed,
        Country,
} from '@sap/cds/common';

type Location: Association to Locations;

entity Movies : cuid, managed {
  title : String @mandatory;
  staff : Association to many Staff on staff.movie = $self;
  scene: Association to many Scenes on scene.movie = $self;
  location: Location;
  status : Status;
}

entity Scenes: cuid, managed {
    title: String;
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
    location:Location;
}

type Proptype: Integer enum{
    warehouse = 0;
    room = 1;
    house = 2;
}

entity Staff:cuid,managed{
    firstName: String;
    lastName: String;
    movie: Association to Movies;
    type: Association to Post;
    booking:Association to many Booking on booking.staff = $self;
}

entity Post: cuid, managed{
title:String;
}

entity Booking: cuid, managed{
    title: String;
    dateFrom: Date;
    dateTo: Date;
    Property: Association to Property;
    staff:Association to Staff;
}


type Status: Integer enum{
    Preprod = 0;
    Production = 1;
    Postproduction = 2;
}