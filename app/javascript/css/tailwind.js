const brandColors = new Object({
    'red': '#e80001',
    'gray-200': "#fafafe",
    'gray-300': '#e7e7e7'
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
