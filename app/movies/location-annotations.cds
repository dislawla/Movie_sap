using MovieService from '../../srv/movie-service';

annotate MovieService.Locations with @(
    UI.HeaderInfo : {
        TypeName        : '{i18n>Locations}',
        TypeNamePlural  : '{i18n>Locations.typeNamePlural}',
        Title           : {
            $Type : 'UI.DataField',
            Value : '{i18n>Locations}',
        },
        Description     : {
            $Type : 'UI.DataField',
            Value : title,
        },
    },


    UI.FieldGroup#LocationsGroup: 
    {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: '{@i18n>LocCountryCode}',
                Value: country.code
            },
            {
                $Type: 'UI.DataField',
                Label: '{@i18n>LocTitle}',
                Value: title
            }
        ],
    }, 

    UI.QuickViewFacets:[
        {
            $Type   : 'UI.ReferenceFacet',
            Target  : '@UI.FieldGroup#LocationsGroup',
            Label   : '{i18n>Locations}',
        }

    ]

);