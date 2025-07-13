using MovieService.Staff from '../../srv/movie-service';
using MovieService.Movies as movies from './annotations.cds';
using MovieService.Employee as employee from './employee-annoations.cds';


annotate MovieService.Staff with @(

    UI.HeaderInfo : {
        TypeName        : '{i18n>Satff}',
        TypeNamePlural  : '{i18n>Staff.typeNamePlural}',
        Title           : {
            $Type : 'UI.DataField',
            Value : '{@i18n>Staff}',
        },
        Description     : {
            $Type : 'UI.DataField',
            Value : employee.lastName
        },
    },

    UI.Facets  : [
            {
             $Type : 'UI.ReferenceFacet',
             ID    : 'EmployeegroupFacet',
             Label : '{@i18n>StaffEmployee}',
             Target: 'employee/@UI.FieldGroup#Employeegroup',
            },
            {
             $Type : 'UI.ReferenceFacet',
             Label : '{@i18n>Movies}',
             Target : 'movie/@UI.LineItem',
            }
    ],

    UI.LineItem #StaffList : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : '{@i18n>StaffFirstName}'
        },
        {
            $Type : 'UI.DataField',
            Value : employee.firstName,
            Label : '{@i18n>StaffFirstName}'
        },
        {
            $Type : 'UI.DataField',
            Value : employee.lastName, 
            Label : '{@i18n>StaffLastName}'
        },
        {
            $Type : 'UI.DataField',
            Value : employee.post.title,  
            Label : '{@i18n>StaffPost}'
        },
    
    ],

    // UI.Facets:
    // [
    //     {
    //          $Type : 'UI.ReferenceFacet',
    //          Label : '{@i18n>Employeegroup}',
    //          Target: 'employee/@UI.FieldGroup#Employeegroup',
    //     },

    // ]
);