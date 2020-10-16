const common = require('./common')
const utils = require('./utils')
common.info('hello common' + utils.add(1,2))

require('./style.css')