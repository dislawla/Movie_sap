using MovieService.Movies from '../../srv/movie-service';
using MovieService.Staff as staff from './staff-annotations.cds';

annotate MovieService.Movies with {
    title    @title: 'Title';
    status   @title: '{i18n>Status}';
} ;


annotate MovieService.Movies with @odata.draft.enabled;

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
        },
        SelectionFields : [
            ID,
            title
        ],     

        LineItem : [
            {
                Value:ID
            },
            {
                Value:title,
                Criticality: crit,
                Label: '{@i18n>Title}'
            },
            {
                Value:status,
                Label:'{@i18n>Status}'
            },
        ],

        LineItem.@UI.Criticality : crit,

        Facets  : [
            {
             $Type : 'UI.ReferenceFacet',
             ID    : 'MoviegroupFacet',
             Label : '{@i18n>Moviegroup}',
             Target: '@UI.FieldGroup#Moviegroup',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : '{@i18n>Staff}',
                Target : 'staff/@UI.LineItem#StaffList',
            },
        ],

        FieldGroup#Moviegroup: {
            
            Data : [
                {
                 $Type: 'UI.DataField',
                 Label: '{@i18n>Title}',
                 Value: title,
                 Criticality:crit
                },
                {
                 $Type: 'UI.DataField',
                 Label: '{@i18n>Status}',
                 Value: status
                }
            ],
        }
    }
);
