const winston = require('winston');
const config = winston.config;
const logger = new (winston.Logger)({
  transports: [
    new (winston.transports.Console)({
      timestamp: function() {
        return new Date().toISOString();
      },
      formatter: function(options) {
        return options.timestamp() + ' ' +
          config.colorize(options.level, options.level.toUpperCase()) + ' ' +
          (options.message ? options.message : '') +
          config.colorize(options.level,(options.meta && Object.keys(options.meta).length ? '\n\t'+ JSON.stringify(options.meta) : '' ))
      },
      prettyPrint: true
    })
  ]
});

logger.error({error:'Application error occured here...'})
logger.info({error:`Database Connection Successfull...DB Name ${'zemuldo'}`})