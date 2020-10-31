window.addEventListener("load", () => {
  if (checkPath()) {
    Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
    const form = document.getElementById("charge-form");
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      
      const formResult = document.getElementById('charge-form');
      const formData = new FormData(formResult);
      const card = createCard(formData);
      
      Payjp.createToken(card, (status, response) => {
        if (status == 200) {
          const token = response.id;
          const renderDom = document.getElementById('charge-form');
          const tokenObj = `<input value=${token} name='order_address[token]' type='hidden'>`;
          renderDom.insertAdjacentHTML('beforeend', tokenObj);
        };
        removeCardInfo();
        document.getElementById('charge-form').submit();
        document.getElementById('charge-form').reset();
      });
    });
  };
});

function checkPath() {
  const path = location.pathname;
  if (path === `/items/${location.pathname.match(/[\d]+/)}/orders/new`) {return true};
  if (path === `/items/${location.pathname.match(/[\d]+/)}/orders`) {return true};
};
function createCard(formData) {
  return {
    number: formData.get('order_address[card_number]'),
    cvc: formData.get('order_address[card_cvc]'),
    exp_month: formData.get('order_address[card_exp_month]'),
    exp_year: `20${formData.get('order_address[card_exp_year]')}`
  }
};
function removeCardInfo() {
  document.getElementById('card-number').removeAttribute('name');
  document.getElementById('card-cvc').removeAttribute('name');
  document.getElementById('card-exp-month').removeAttribute('name');
  document.getElementById('card-exp-year').removeAttribute('name');
};

