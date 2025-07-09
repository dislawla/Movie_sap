using MovieService from '../../srv/movie-service';
// using MovieService.Employee as employee from './employee-annoations.cds';

annotate MovieService.Staff with @(

    UI.HeaderInfo : {
        TypeName        : '{i18n>Satff}',
        TypeNamePlural  : '{i18n>Staff.typeNamePlural}',
        Title           : {
            $Type : 'UI.DataField',
            Value : '{i18n>Staff}',
        },
        Description     : {
            $Type : 'UI.DataField',
            Value : employee.lastName
        },
    },

    UI.Facets  : [
            {
             $Type : 'UI.ReferenceFacet',
             ID    : 'StaffgroupFacet',
             Label : '{@i18n>Moviegroup}',
             Target: '@UI.FieldGroup#Satffgroup',
            }
    ],

    UI.FieldGroup#Satffgroup: {
            
            Data : [
                {
                 $Type: 'UI.DataField',
                 Label: '{@i18n>Title}',
                 Value: employee.firstName
                },
                {
                 $Type: 'UI.DataField',
                 Label: '{@i18n>Status}',
                 Value: employee.post.title
                }
            ],
    },

    UI.SelectionFields : [
            ID
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