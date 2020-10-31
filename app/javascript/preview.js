window.addEventListener("load", () => {
  if (checkPath()) {
    const itemImage = document.getElementById("item-image");
    itemImage.addEventListener("change", function(e) {
      const imageContent = document.getElementById("image-blob");
      if (imageContent) {imageContent.remove();}

      const imageHTML = createImageHTML(e);
      
      const ImageList = document.getElementById("image-list");
      ImageList.insertAdjacentHTML("afterbegin", imageHTML);
    });
  }
});

function checkPath() {
  const path = location.pathname
  if (path === "/items/new") {return true};
  if (path === "/items") {return true};
  if (path === `/items/${location.pathname.match(/[\d]+/)}/edit`) {return true};
  if (path === `/items/${location.pathname.match(/[\d]+/)}`) {return true};
};
function createImageHTML(e) {
  const file = e.target.files[0];
  const blob = window.URL.createObjectURL(file);
  return `
  <img src="${blob}" id="image-blob" style="max-width: 100%;">
  `
};