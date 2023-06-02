
function randomBackgroundImage() {
   
    // массив картинок
    let images    = ['background/image.jpg', 'background/image1.jpg', 'background/image2.jpg'];
   
    // контейнер у которого будем менять фоновое изображение
    let imageBox  = document.body.style.backgroundImage;
   
    // выбираем случайную картинку
    let image     = Math.floor( Math.random() * images.length );
   
    // меняем фон на эту картинку
    document.body.style.backgroundImage = 'url(' + images[image] + ')';
}

// вызываем при загрузке/перезагрузке страницы
window.onload = randomBackgroundImage;
