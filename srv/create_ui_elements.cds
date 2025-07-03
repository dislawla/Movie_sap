using MovieService from './movie-service.cds';

annotate MovieService.Movies with {
    title    @title: 'Title';
    staff    @title: 'Staff';
    scene    @title: 'Scene';
    location @title: 'Location';
    status   @title: 'Status';
} ;


