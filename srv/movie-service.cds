using { sap.movie as mv } from '../db/schema';

service CatalogService @(path: '/movie') { 

  entity Movies as projection on mv.Movies;

}