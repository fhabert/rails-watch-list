const initUpdateNavbarOnScroll = () => {
    const navbar = document.querySelector('.navbar-home');
    if (navbar) {
      window.addEventListener('scroll', () => {
        if (window.scrollY >= window.innerHeight) {
            navbar.classList.add('navbar-home-black');
        } else {
            if (navbar.classList.contains('navbar-home-black')) {
              navbar.classList.remove('navbar-home-black');
            }
        }
      });
    }
  }
  
  export { initUpdateNavbarOnScroll };