using MovieService.Staff from '../../srv/movie-service';
using MovieService.Employee as employee from './employee-annoations.cds';

annotate MovieService.Staff with {
    employee @Common.Text : employee.lastName @Common.TextArrangement : #TextOnly 
    @Common.ValueList       : {
            Label          : '{i18n>Employee}',
            CollectionPath : 'Employee',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    ValueListProperty : 'ID',
                    LocalDataProperty : employee_ID
                },
                {
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'firstName',
                },
                {
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'lastName',
                }
                
            ]
        }
};

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
            Value : employee_ID
        },
    },

    UI.Facets  : [
            {
             $Type : 'UI.ReferenceFacet',
             ID    : 'StaffGroupFacet',
             Label : '{@i18n>StaffMainData}',
             Target: '@UI.FieldGroup#StaffGroup',
            },
            {
             $Type : 'UI.ReferenceFacet',
             ID    : 'EmployeegroupFacet',
             Label : '{@i18n>StaffEmployeeGroup}',
             Target: 'employee/@UI.FieldGroup#Employeegroup',
            }
    ],
    
    UI.FieldGroup#StaffGroup: {
            
            Data : [
                {
                 $Type: 'UI.DataField',
                 Label: '{@i18n>EmployeeID}',
                 Value: employee_ID
                }
                
            ],
    },

    UI.LineItem #StaffList : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : '{@i18n>ID}'
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

);