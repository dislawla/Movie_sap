using MovieService from '../../srv/movie-service';

annotate MovieService.Locations with @(
    UI: {
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Locations',
            TypeNamePlural : 'Locations',
            Title:{
                $Type : 'UI.DataField',
                Label : '{i18n>Locationtitle}',
                Value : title,
            },
        },

        SelectionFields : [
            ID,
            title
        ],     
    }
);