const pay = () => {
  const path = location.pathname;
  if (checkPath(path)) {
    Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
    const form = document.getElementById("charge-form");
    form.addEventListener("submit", (e) => {
      e.preventDefault();
  
      const formResult = document.getElementById('charge-form');
      const formData = new FormData(formResult);
  
      const card = {
        number: formData.get('order_address[card_number]'),
        cvc: formData.get('order_address[card_cvc]'),
        exp_month: formData.get('order_address[card_exp_month]'),
        exp_year: `20${formData.get('order_address[card_exp_year]')}`
      };
  
      Payjp.createToken(card, (status, response) => {
        if (status == 200) {
          const token = response.id;
          const renderDom = document.getElementById('charge-form');
          const tokenObj = `<input value=${token} name='token' type='hidden'>`;
          renderDom.insertAdjacentHTML('beforeend', tokenObj);
        };
        debugger;
        removeCardInfo();
        document.getElementById('charge-form').submit();
      });
    });
  };
};

function removeCardInfo() {
  document.getElementById('card-number').removeAttribute('name');
  document.getElementById('card-cvc').removeAttribute('name');
  document.getElementById('card-exp-month').removeAttribute('name');
  document.getElementById('card-exp-year').removeAttribute('name');
};

function checkPath(path) {
  if (path === `/items/${location.pathname.match(/\d/)}/orders/new`) {return true};
  if (path === `/items/${location.pathname.match(/\d/)}/orders`) {return true};
};

window.addEventListener('load', pay);