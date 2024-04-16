import type { Config } from 'tailwindcss'
import { blackA, grass } from '@radix-ui/colors'

export default {
  content: ['./app.vue', './pages/**/*.vue', './components/**/*.vue'],
  theme: {
    fontFamily: {
      title: ['CardboardCat'],
      body: ['Figtree'],
    },
    extend: {
      colors: {
        background: '#1D252F',
        text: '#EAF8F7',
        primary: '#3D6191',
        secondary: '#C2A965',
        accent: '#FFEEBB',
        brown: '#393424',
        ...blackA,
        ...grass,
      },
    },
  },
  plugins: [],
} satisfies Config
