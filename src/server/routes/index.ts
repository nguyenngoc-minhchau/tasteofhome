import express from 'express'
import dotenv from 'dotenv'
import loginRoute from '@/src/server/routes/login'

dotenv.config()
const app = express()
app.use(express.json())

app.use('/auth', loginRoute)

app.listen(3001, () => {
  console.log('Auth server running on http://localhost:3001')
})
