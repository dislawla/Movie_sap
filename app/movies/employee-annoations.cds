using MovieService.Employee from '../../srv/movie-service';

annotate MovieService.Employee with {
    post @Common : { 
        Text : 'emplyee.post.title',
        TextArrangement : #TextOnly ,
        ValueList       : {
            Label          : '{i18n>Location}',
            CollectionPath : 'Posts',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    ValueListProperty : 'ID',
                    LocalDataProperty : post_ID
                },
                {
                    $Type: 'Common.ValueListParameterOut',
                    ValueListProperty: 'title',
                }
                
            ]
        }
     }
     

}
    
;

annotate MovieService.Employee with @(


UI.HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Employees',
            TypeNamePlural : 'Employees',
            Title:{
                $Type : 'UI.DataField',
                Label : '{i18n>Employeestitle}',
                Value : lastName,
            },
        },

    UI.Facets: [
        {
             $Type : 'UI.ReferenceFacet',
             ID    : 'EmployeegroupFacet',
             Label : '{@i18n>StaffEmployee}',
             Target: '@UI.FieldGroup#Employeegroup',
            }
    ],

    UI.FieldGroup#Employeegroup: {
            
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: '{@i18n>LastName}',
                Value: lastName,
                },
                {
                 $Type: 'UI.DataField',
                 Label: '{@i18n>FirstName}',
                 Value: firstName
                },
                {
                 $Type: 'UI.DataField',
                 Label: '{@i18n>PostTitle}',
                 Value: post_ID
                },
            
        ],
    }
);