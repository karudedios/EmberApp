express = require 'express'
router = express.Router()
app = express()

app
	.get '/default', (req, res) ->
    	res.send({ work: yes })
      
app.use '/', (req, res) ->
  	res.sendFile '/public/templates/index.html'

app.listen 3000