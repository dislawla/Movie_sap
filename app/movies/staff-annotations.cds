using MovieService from '../../srv/movie-service';
// using MovieService.Employee as employee from './employee-annoations.cds';

annotate MovieService.Staff with @(


    UI.LineItem #StaffList : [
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