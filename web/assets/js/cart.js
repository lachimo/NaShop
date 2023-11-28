var inputQuantity = document.querySelectorAll(".cart__number");
var plusButton = document.querySelectorAll(".cart__plus");
var minusButton = document.querySelectorAll(".cart__minus");

Array.from(inputQuantity).forEach(function (input, index) {
    var quantity = Number(input.value);

    input.onblur = function (e) {
        if (Number(input.value) >= Number(input.max)) {
            e.target.value = input.max;
            quantity = Number(e.target.value);
            input.setAttribute("value", quantity);
        }

        if (Number(e.target.value) <= Number(input.min)) {
            e.target.value = input.min;
            quantity = Number(e.target.value);
            input.setAttribute("value", quantity);
        }
    };

    input.oninput = function (e) {
        if (
            Number(e.target.value) < Number(input.max) &&
            Number(e.target.value) > Number(input.min)
        ) {
            quantity = Number(e.target.value);
            input.setAttribute("value", quantity);
        }
    };

    plusButton[index].onclick = function () {
        if (quantity < Number(input.max)) {
            quantity++;
            input.value = quantity;
            input.setAttribute("value", quantity);
        }
    };
    minusButton[index].onclick = function () {
        if (quantity > Number(input.min)) {
            quantity--;
            input.value = quantity;
            input.setAttribute("value", quantity);
        }
    };
});