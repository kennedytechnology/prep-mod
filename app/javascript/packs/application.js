// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("@rails/activestorage")
require("chartkick")
require("chart.js")
require("awesomplete")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import '../css/application.scss'
require("packs/direct_upload")
require("packs/new_kit")
import "controllers"

// Prevent leaving page if form is unsaved
// $(document).on('turbolinks:load', function () {
  $(function () {
      $("input, textarea, select").on("input change", function() {
          window.onbeforeunload = window.onbeforeunload || function (e) {
              return "You have unsaved changes.  Do you want to leave this page and lose your changes?";
          };
      });
      $("form").on("submit", function() {
          window.onbeforeunload = null;
      });
  })
// });