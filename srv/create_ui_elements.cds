using MovieService from './movie-service.cds';

annotate MovieService.Movies with {
    title    @title: 'Title';
    staff    @title: 'Staff';
    scene    @title: 'Scene';
    location @title: 'Location';
    status   @title: 'Status';
} ;

annotate MovieService.Movies with @(
    UI: {
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Movies',
            TypeNamePlural : 'Movies',
            Title:{
                $Type : 'UI.DataField',
                Label : '{i18n>Movietitle}',
                Value : title,
            },

            Status:{
                $Type : 'UI.DataField',
                Label : '{i18n>Moviestatus}',
                Value : status,
            }
        },
        SelectionFields : [
            ID,
            title
        ],
        LineItem  : [
            {Value:title},
            {Value:ID},
            {Value:status}
        ],

        Facets  : [
            {
             $Type : 'UI.ReferenceFacet',
             ID    : 'MoviegroupFacet',
             Label : '{i18n>Moviegroup}',
             Target: '@UI.FieldGroup#Moviegroup',
            },
        ],

        FieldGroup#Moviegroup: {
            $Type : 'UI.FieldGroupType',
            Data : [
                {
                 $Type: 'UI.DataField',
                 Label: '{i18n>Movietitle}',
                 Value: title,
                },
            ],
        }
    }
);

