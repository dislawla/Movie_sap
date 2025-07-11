using MovieService.Movies from '../../srv/movie-service';
using MovieService.Staff as staff from './staff-annotations.cds';
using MovieService.Locations as locations from './location-annotations.cds';
using MovieService.Scenes as scene from './scenes-annotations.cds';

annotate MovieService.Movies with {
    title  @title: 'Title';
    location @Common.Text : location.country_code @Common.TextArrangement : #TextOnly;
    status @title: '{i18n>Status}' @Common.Text : status.name @Common.TextArrangement : #TextOnly
};

annotate MovieService.Movies with @(
    UI               : {
        HeaderInfo              : {
            $Type         : 'UI.HeaderInfoType',
            TypeName      : 'Movies',
            TypeNamePlural: 'Movies',
            Title         : {
                $Type: 'UI.DataField',
                Label: '{i18n>Movietitle}',
                Value: title,
            },
        },
        SelectionFields         : [
            ID,
            title
        ],

        LineItem                : [
            {Value: ID},
            {
                Value      : title,
                Criticality: crit,
                Label      : '{@i18n>Title}'
            },
            {
                Value: status.code,
                Label: '{@i18n>Status}'
            },
            {
                $Type            : 'UI.DataField',
                Value            : location_ID,
                Label            : '{i18n>Location}',
                ![@UI.Importance]: #High,
            },
            {
                Value: createdAt,
                Label: '{@i18n>CreatedAt}'
            },
            {
                Value: createdBy,
                Label: '{@i18n>CreatedBy}'
            },
        ],
    

        LineItem.@UI.Criticality: crit,

        Facets                  : [
            {
                $Type : 'UI.ReferenceFacet',
                ID    : 'MoviegroupFacet',
                Label : '{@i18n>Moviegroup}',
                Target: '@UI.FieldGroup#Moviegroup',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : '{@i18n>Locations}',     
                Target: 'location/@UI.FieldGroup#LocationsGroup',
            },
            // {
            //  $Type : 'UI.ReferenceFacet',
            //  Label : '{@i18n>Locgroup}',
            //  Target : 'locations/@UI.FieldGroup#LocationsGroup',
            // },
            {
                $Type : 'UI.ReferenceFacet',
                Label : '{@i18n>Staff}',
                Target: 'staff/@UI.LineItem#StaffList',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : '{@i18n>Scenes}',     
                Target: 'scene/@UI.LineItem#ScenesList',
            }
        ],

        FieldGroup #Moviegroup  : {

        Data: [
            {
                $Type      : 'UI.DataField',
                Label      : '{@i18n>Title}',
                Value      : title,
                Criticality: crit
            },
            {
                $Type: 'UI.DataField',
                Label: '{@i18n>Status}',
                Value: status_code
            }
        ], }
    },
    // UI.HeaderFacets: [
    //     {
    //         $Type : 'UI.ReferenceFacet',
    //         Target : '@UI.FieldGroup#Actions',
    //         Label : '{@i18n>Actions}'
    //     }
    // ],

    UI.Identification: [
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'MovieService.pushMovieStatus',
            Label : '{@i18n>pushMovieStatus}',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'MovieService.backMovieStatus',
            Label : '{@i18n>backMovieStatus}',
        }
    ] //,

// UI.FieldGroup #Actions : {
//     $Type: 'UI.FieldGroupType',
//     Data: [
//         {
//             $Type : 'UI.DataFieldForAction',
//             Action : 'MovieService.pushMovieStatus',
//             Label : '{@i18n>pushMovieStatus}'
//         }
//     ]
// }

);
