const brandColors = new Object({
  'red': '#e80001' ,
  'gray': {
    '200': '#fafafe'
  }
})
module.exports = {
  theme: {
    extend: { 
      colors: {
        'brand': brandColors
      },
      borderColor: {
        gray: '#e7e7e7'
      }
    },
  },
  variants: {},
  plugins: [],
}
