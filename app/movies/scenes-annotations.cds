using MovieService from '../../srv/movie-service';

annotate MovieService.Scenes with @(

    UI: {
        LineItem #ScenesList: [
            {
              $Type: 'UI.DataField',
              Value: title,
              Label: '{i18n>Title}'
            }
        ],
    },
);