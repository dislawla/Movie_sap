using MovieService.Scenes from '../../srv/movie-service';
using MovieService.Locations as locations from './location-annotations.cds';

annotate MovieService.Scenes with {
    title  @title: 'Title' @mandatory;
    location @Common.Text : location.country_code @Common.TextArrangement : #TextOnly 
    @Common.ValueList       : {
            Label          : '{@i18n>Location}',
            CollectionPath : 'Locations',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    ValueListProperty : 'ID',
                    LocalDataProperty : location_ID
                },
                {
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'country_code',
                },
                {
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'title',
                }
                
            ]
        };
    
};

annotate MovieService.Scenes with @(

    UI.HeaderInfo : {
        TypeName        : '{i18n>Scenes}',
        TypeNamePlural  : '{i18n>Scenes.typeNamePlural}',
        Title           : {
            $Type : 'UI.DataField',
            Value : '{@i18n>Scene}',
        },
        Description     : {
            $Type : 'UI.DataField',
            Value : ID
        },
    },

    UI.Facets  : [
            {
             $Type : 'UI.ReferenceFacet',
             ID    : 'ScenesGroupFacet',
             Label : '{@i18n>Scenegroup}',
             Target: '@UI.FieldGroup#Scenesgroup',
            },
            {
             $Type : 'UI.ReferenceFacet',
             ID    : 'SceneLocGroupFacet',
             Label : '{@i18n>ScenesLoc}',
             Target: 'location/@UI.FieldGroup#LocationsGroup',
            }
    ],

    UI.FieldGroup#Scenesgroup: {
            
            Data : [
                {
                 $Type: 'UI.DataField',
                 Label: '{@i18n>Title}',
                 Value: title
                },
                {
                 $Type: 'UI.DataField',
                 Label: '{@i18n>Location}',
                 Value: location_ID
                }
            ],
    },

    UI.LineItem #ScenesList: [
            {
              $Type: 'UI.DataField',
              Value: ID,
              Label: '{i18n>ID}'
            },
            {
              $Type: 'UI.DataField',
              Value: title,
              Label: '{i18n>Title}'
            },
            {
                $Type            : 'UI.DataField',
                Value            : location_ID,
                Label            : '{i18n>Location}',
                ![@UI.Importance]: #High,
            }
        ]
);