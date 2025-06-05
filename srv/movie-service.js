const cds = require ('@sap/cds');

class MovieService extends cds.ApplicationService{

init(){

    const { Movies } = cds.entities('MovieService');

    this.on ('pushMovieStatus', async req => {
        const {movieID} = req.data

        const movie = await SELECT.one.from(Movies).where({ ID: movieID });

        if (movie.status >= 3){
            return req.error('CANT_UPDATE_STATUS');
        }

        const n = await UPDATE (Movies, movieID)
          .with ({ status: {'+=': 1 }})

        if (n > 0) {
            return{ message: 'PROMOTE_MOVIE_STATUS_SUCCSESS' }
        }
      })

    return super.init();
}

}

module.exports = MovieService;