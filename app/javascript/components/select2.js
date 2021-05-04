import 'select2';

const movies_dropdown = () => {
    $('.movies-select2').select2( {
        selectOnClose: true    
    });
};

export { movies_dropdown };