const brandColors = new Object({
    'red': '#e80001',
    'red-400': '#c04040',
    'red-500': '#E41F21',
    'gray-100': '#fcfcfcad',
    'gray-200': "#fafafe",
    'gray-300': '#e7e7e7',
    'gray-600': '#666666',
    'gray-900': '#333333',
    'blue-200': "#BCE0FD",
    'blue-300': "#7FC4FD",
    'blue-600': "#2699FB"
})
module.exports = {
  theme: {
    extend: {
      colors: {
        'brand': brandColors
      }
    },
  },
  variants: {},
  plugins: [
      require('@tailwindcss/ui')
  ]
}
