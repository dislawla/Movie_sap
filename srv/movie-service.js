const cds = require ('@sap/cds');

class MovieService extends cds.ApplicationService{

init(){

    const { Movies,Status } = cds.entities('MovieService');

    this.on('READ', Movies, async (req,next) => {

      const results = await next();

      const movies = Array.isArray(results) ? results : [results];

      let movieStatusValue;

      movies.forEach(movie => {  

        if ('status' in movie){
          movieStatusValue = movie.status.code;
        }else{
          movieStatusValue = movie.status_code;
        }

        switch (movieStatusValue) {
            case 0: 
                movie.crit = 1; 
                break;
            case 1:
                movie.crit = 2;
                break;
            case 2: 
                movie.crit = 3;
                break;
            case 3:
                movie.crit = 1; 
                break;
            default:
                movie.crit = 3; 
        }
        
        if (movie.title == "Догони если сможешь") {
          movie.crit = 3;  
        }

      });
    })

    this.before ('pushMovieStatus', Movies.drafts, async req => {

      const movieKeys = req.params[0]; 

      const movie = await SELECT.one.from(Movies, movieKeys);

        if (movie.status_code >= 3){
            return req.error('CANT_UPDATE_STATUS');
        }

    })

    this.before ('pushMovieStatus', Movies, async req => {

      req.notify(`Critical action pressed`);

      const movieKeys = req.params[0]; 

      const movie = await SELECT.one.from(Movies, movieKeys);

        if (movie.status_code >= 3){
            return req.error('CANT_UPDATE_STATUS');
        }

    })

      this.on ('backMovieStatus', Movies, async req => {

        const movieKeys = req.params[0]; 

        const movie = await SELECT.one.from(Movies, movieKeys);

        if (!movie) return req.error('MOVIE_NOT_FOUND');

        const newStatus = movie.status_code - 1;

        const n = await UPDATE(Movies, movieKeys).with({ status_code: newStatus });

        const status = await SELECT.one.from(Status).where({ code: newStatus}); 

        if (n > 0) {
            return req.info( 'PROMOTE_MOVIE_STATUS_SUCCSESS',[status.name] )
        }
      })

      this.on ('pushMovieStatus', Movies.drafts, async req => {

        const movieKeys = req.params[0]; 

        const movie = await SELECT.one.from(Movies, movieKeys);

        if (!movie) return req.error('MOVIE_NOT_FOUND');

        const newStatus = movie.status_code + 1;

        const n = await UPDATE(Movies, movieKeys).with({ status_code: newStatus });

        const status = await SELECT.one.from(Status).where({ code: newStatus}); 

        if (n > 0) {
            return req.info( 'PROMOTE_MOVIE_STATUS_SUCCSESS',[status.name] )
        }
      })

      this.on ('pushMovieStatus', Movies, async req => {

        const movieKeys = req.params[0]; 

        const movie = await SELECT.one.from(Movies, movieKeys);

        if (!movie) return req.error('MOVIE_NOT_FOUND');

        const newStatus = movie.status_code + 1;

        const n = await UPDATE(Movies, movieKeys).with({ status_code: newStatus });

        const status = await SELECT.one.from(Status).where({ code: newStatus}); 

        if (n > 0) {
            return req.info( 'PROMOTE_MOVIE_STATUS_SUCCSESS',[status.name] )
        }
      })

    this.after ('CREATE',Movies, (data, req) => {
      req.info( 'MOVIE_CREATED',[data.title] )
      return data
    })

    this.on('getActorsCount', async req => {
      const { movieID } = req.data;
    const { Staff } = cds.entities('MovieService');

    const result = await SELECT.from(Staff)
                             .where({ movie_ID: movieID })
                             .columns('count(DISTINCT employee_ID) as actorsCount');
      
      return result[0].actorsCount;
  });

  this.on('sleep', async () => {
    try {
        let dbQuery = ' Call "sleep"( )'
        let result = await cds.run(dbQuery, { })
        cds.log().info(result)
        return true
    } catch (error) {
        cds.log().error(error)
        return false
    }
  });

    return super.init();
}

}

module.exports = MovieService;