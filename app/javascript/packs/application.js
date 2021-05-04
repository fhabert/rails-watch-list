// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import 'bootstrap';
import AOS from 'aos';
import "jquery-bar-rating/dist/themes/css-stars";
import { start } from 'turbolinks';
AOS.init();
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import { loadDynamicBannerText } from '../components/banner';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { starOnRating } from '../components/rating';
import { movies_dropdown } from '../components/select2';

document.addEventListener('turbolinks:load', () => {
  loadDynamicBannerText();
  initUpdateNavbarOnScroll();
  starOnRating();
  movies_dropdown();
});