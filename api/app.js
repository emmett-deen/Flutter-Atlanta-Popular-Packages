import express from 'express'
import coffee from './sample.json' assert { type: "json" }
const app = express()
const port = 3000

app.get('/coffee', (req, res) => {
    res.send(coffee)
})

app.listen(port, () => {
    console.log(`Coffee api listening on port ${port}`)
})