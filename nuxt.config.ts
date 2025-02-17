// https://nuxt.com/docs/api/configuration/nuxt-config
import dotenv from 'dotenv'
dotenv.config({ path: '.env.local' })

export default defineNuxtConfig({
  compatibilityDate: '2024-11-01',
  devtools: { enabled: true }
})
