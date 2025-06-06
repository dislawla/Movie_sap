namespace sap.movie; 

using {  
        cuid,
        managed,
        Country,
} from '@sap/cds/common';

type Location: Association to Locations;

type EmailAddress : { kind:String; address:String; }
type EmailAddresses : many EmailAddress;

type Status: Integer enum{
    Concept = 0;
    Production = 1;
    Postproduction = 2;
    Released = 3;
}

aspect EmployeeName  {
    firstName : String @mandatory ;
    lastName  : String @mandatory ;
}



entity Movies : cuid, managed {
  title : localized String @mandatory ;
  staff : Composition of many Staff on staff.movie = $self @cds.autoexpose;
  scene: Composition of many Scenes on scene.parent = $self @cds.autoexpose;
  location: Location @cds.autoexpose;
  status : Status @mandatory @default : 0;

}

entity Scenes: cuid, managed {
    key parent : Association to Movies @mandatory @assert.target;
    title: String @mandatory ;
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

entity Staff:cuid, managed {
    movie: Association to Movies;
    employee: Association to Employee;
}

entity Employee:cuid, managed, EmployeeName {
    staff: Composition of many Staff on staff.employee = $self;
    post: Association to Post;
    booking:Association to many Booking on booking.employee = $self;
    Emails: EmailAddresses;
}

entity EmployName as select from Employee{
 ID,
 (firstName || ' ' || lastName) as fullname
}


entity Post: cuid, managed{
title:String;
}

entity Booking: cuid, managed{
    title: String @mandatory ;
    dateFrom: Date;
    dateTo: Date;
    Property: Association to Property;
    employee:Association to Employee;
}

