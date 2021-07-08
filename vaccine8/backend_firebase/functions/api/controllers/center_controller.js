'use strict'

const Controller = require('./controller')
const centerModel = require('../models/center_model')

const centerController = new Controller(centerModel)
module.exports = centerController.router