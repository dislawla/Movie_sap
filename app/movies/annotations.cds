using MovieService as service from '../../srv/movie-service';
annotate service.Movies with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'status',
                Value : status,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>Staff}',
            ID : 'i18nStaff',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Staff',
                    ID : 'Staff',
                    Target : 'staff/@UI.LineItem#Staff',
                },
            ],
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Movietitle}',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Moviestatus}',
            Value : status,
        },
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : '{i18n>Movieid}',
        },
        {
            $Type : 'UI.DataField',
            Value : location.country_code,
        },
        {
            $Type : 'UI.DataField',
            Value : scene.title,
        },
        {
            $Type : 'UI.DataField',
            Value : staff.firstName,
        },
        {
            $Type : 'UI.DataField',
            Value : staff.lastName,
        },
    ],
    UI.SelectionFields : [
        status,
        location.country_code,
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeImageUrl : 'sap-icon://video',
    },
);

annotate service.Movies with {
    location @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Locations',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : location_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'country_code',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'title',
            },
        ],
    }
};

annotate service.Movies with {
    status @Common.Label : '{i18n>Moviestatus}'
};

annotate service.Movies with {
    title @Common.Label : 'title'
};

annotate service.Staff with @(
    UI.LineItem #Staff : [
    ]
);

