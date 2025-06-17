const cds = require ('@sap/cds');

class MovieService extends cds.ApplicationService{

init(){

    const { Movies } = cds.entities('MovieService');

    this.before ('pushMovieStatus', async req => {

      const {movieID} = req.data

      const movie = await SELECT.one.from(Movies).where({ ID: movieID });

        if (movie.status >= 3){
            return req.error('CANT_UPDATE_STATUS');
        }

    })

    this.on ('pushMovieStatus', async req => {
        const {movieID} = req.data

            // Получить текущее значение
        const movie = await SELECT.one.from(Movies).where({ ID: movieID });
        if (!movie) return req.error('MOVIE_NOT_FOUND');

           // Увеличить статус
        const newStatus = movie.status + 1;

            // Обновить статус
         const n = await UPDATE(Movies, movieID).with({ status: newStatus });

        if (n > 0) {
            return req.info( 'PROMOTE_MOVIE_STATUS_SUCCSESS',[newStatus] )
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
  
  this.on('getMoviesByStatus', async req => {
    const { status } = req.data;
    const { MVStatus } = cds.entities('MovieService');

    const result =  await SELECT.from(MVStatus, {MvStatus: status})
    
    return result;
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