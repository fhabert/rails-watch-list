import 'jquery-bar-rating'; 

const starOnRating = () => {
    // const rating = document.getElementById('rating-star');
    $('#rating-star').barrating({
        theme: 'css-stars'
      });
 };

 export { starOnRating };