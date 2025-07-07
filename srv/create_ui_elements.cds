// using MovieService from './movie-service.cds';

// annotate MovieService.Movies with {
//     title    @title: '{i18n>Title}';
//     staff    @title: '{i18n>Staff}';
//     scene    @title: '{i18n>Scene}';
//     location @title: '{i18n>Location}';
//     status   @title: '{i18n>Status}';
// } ;


// // annotate MovieService.Movies with @odata.draft.enabled;

// annotate MovieService.Movies with @(
//     UI: {
//         HeaderInfo  : {
//             $Type : 'UI.HeaderInfoType',
//             TypeName : 'Movies',
//             TypeNamePlural : 'Movies',
//             Title:{
//                 $Type : 'UI.DataField',
//                 Label : '{i18n>Movietitle}',
//                 Value : title,
//             },
//         },
//         SelectionFields : [
//             ID,
//             title
//         ],     

//         LineItem : [
//             {Value:title,
//              Criticality: crit,
//              Label:'{i18n>Title}'},
//             {Value:ID},
//             {Value:status}
//         ],

//         LineItem.@UI.Criticality : crit,

//         Facets  : [
//             {
//              $Type : 'UI.ReferenceFacet',
//              ID    : 'MoviegroupFacet',
//              Label : '{i18n>Moviegroup}',
//              Target: '@UI.FieldGroup#Moviegroup',
//             },
//         ],

//         FieldGroup#Moviegroup: {
//             $Type : 'UI.FieldGroupType',
//             Data : [
//                 {
//                  $Type: 'UI.DataField',
//                  Label: '{i18n>Movietitle}',
//                  Value: title,
//                 },
//             ],
//         }
//     }
// );

