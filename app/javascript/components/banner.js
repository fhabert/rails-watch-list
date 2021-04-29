import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["By using our simple app", "Make your dream store", "Come true"],
    typeSpeed: 60,
    loop: true
  });
}

export { loadDynamicBannerText };