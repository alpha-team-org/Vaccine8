'use strict'

const Model = require('./model')

// Here, we are implementing the class with Singleton design pattern

class CenterModel extends Model {
    constructor() {
        super('centers')
        if (this.instance) return this.instance
        CenterModel.instance = this
    }
}

module.exports = new CenterModel()