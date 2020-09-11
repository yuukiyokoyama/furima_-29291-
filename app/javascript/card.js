const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", function (e) {
    e.preventDefault();
 
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
 
    const card = {
      number: document.getElementById("card-number").value,
      cvc: document.getElementById("card-cvc").value,
      exp_month: document.getElementById("card-exp-month").value,
      exp_year: `20${document.getElementById("card-exp-year").value}`,
    };

    Payjp.createToken(card, (status, response) => {
     

      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
       
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
      } else {document.getElementById("charge-form").submit();
      }
    });
  });
 };
 
 window.addEventListener("load", pay);