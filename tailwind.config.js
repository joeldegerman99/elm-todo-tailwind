/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./src/**/*.elm'],
  theme: {
    extend: {
      colors: {
        primary: '#4F46E5',
        secondary: '#3B82F6',
        accent: '#FBBF24',
        neutral: '#374151',
        'base-100': '#FFFFFF',
        info: '#3ABFF8',
        success: '#36D399',
        warning: '#FBBD23',
        error: '#F87272'
      },
    },
  },
  variants: []
}
