using MovieService from '../../srv/movie-service';

annotate MovieService.Employee with @(
UI: {
    HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Employees',
            TypeNamePlural : 'Employees',
            Title:{
                $Type : 'UI.DataField',
                Label : '{i18n>Employeestitle}',
                Value : lastName,
            },
        },
    FieldGroup#Employeegroup: {
            
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: '{@i18n>Title}',
                Value: lastName,
                },
                {
                 $Type: 'UI.DataField',
                 Label: '{@i18n>Status}',
                 Value: firstName
                },
                {
                 $Type: 'UI.DataField',
                 Label: '{@i18n>Status}',
                 Value: post.title
                }
        ],
    },
},
);