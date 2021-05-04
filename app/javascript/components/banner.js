import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const typedBanner = document.getElementById('banner-typed-text');
  if (typedBanner) {
    new Typed('#banner-typed-text', {
      strings: ["By using our simple app", "Make your dream store", "Come true"],
      typeSpeed: 60,
      loop: true
    });
  }
}

export { loadDynamicBannerText };