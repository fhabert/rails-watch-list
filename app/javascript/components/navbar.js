const initUpdateNavbarOnScroll = () => {
    const navbar = document.getElementsByClassName('navbar-home');
    if (navbar) {
      window.addEventListener('scroll', () => {
        if (window.scrollY >= window.innerHeight) {
            navbar.classList.add('navbar-home-black');
        } else {
            navbar.classList.remove('navbar-home-black');
        }
      });
    }
  }
  
  export { initUpdateNavbarOnScroll };