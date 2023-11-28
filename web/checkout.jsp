<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Smaller</title>

        <!-- Embed Reset -->
        <link rel="stylesheet" href="./assets/css/reset.css" />

        <!-- Embed Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Ysabeau+Infant:ital,wght@0,400;0,500;0,700;0,900;1,400;1,500;1,700;1,900&display=swap"
            rel="stylesheet"
        />

        <!-- Embed css -->
        <link rel="stylesheet" href="./assets/css/main.css" />
    </head>
    <body>
        <c:import url="./header.jsp" />
        <main>
            <div class="checkout">
                <div class="container">
                    <form
                        action="MainController"
                        method="POST"
                        class="checkout__inner"
                    >
                        <c:url var="cartItem" value="MainController">
                            <c:param name="action" value="Cart" />
                        </c:url>
                        <!-- <a class="checkout__back" href="${cartItem}"
                            ><img src="./assets/icons/x.svg" alt=""
                        /></a> -->
                        <!-- <c:url var="productUrl" value="MainController">
                            <c:param name="action" value="Product" />
                        </c:url>
                        <a href="${productUrl}" class="checkout__product"
                            ><img
                                class="checkout__product-image"
                                src="./assets/icons/shopping-cart-full.svg"
                                alt=""
                            />
                            <p class="checkout__product-text">
                                Continues shopping
                            </p>
                        </a> -->
                        <div class="checkout__content">
                            <h1 class="checkout__heading">
                                Checkout information
                            </h1>
                            <div class="checkout__name">
                                <div class="checkout__first-name">
                                    <label for="firstName" class="form-label"
                                        ><p class="form-title">
                                            First name
                                        </p></label
                                    >
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="firstName"
                                        placeholder="Input your first name"
                                        name="firstName"
                                        required=""
                                    />
                                </div>

                                <div class="checkout__last-name">
                                    <label for="lastName" class="form-label"
                                        ><p class="form-title">
                                            Last name
                                        </p></label
                                    >
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="lastName"
                                        placeholder="Input your last name"
                                        name="lastName"
                                        required=""
                                    />
                                </div>
                            </div>

                            <div class="checkout__phone">
                                <label for="phone" class="form-label"
                                    ><p class="form-title">Phone</p></label
                                >
                                <input
                                    type="number"
                                    class="form-control"
                                    id="phone"
                                    placeholder="Input your phone number"
                                    required=""
                                    name="phone"
                                />
                            </div>

                            <div class="checkout__address">
                                <label for="address" class="form-label"
                                    ><p class="form-title">Address</p></label
                                >
                                <input
                                    type="text"
                                    class="form-control"
                                    id="address"
                                    placeholder="Input your address"
                                    name="address"
                                    required=""
                                />
                            </div>

                            <div class="checkout__note">
                                <label for="note" class="form-label"
                                    ><p class="form-title">Note</p>
                                    <p class="form-option">(optional)</p></label
                                >
                                <textarea
                                    class="contact__form-textarea checkout-text__form"
                                    name="yourself"
                                    id="yourself"
                                    placeholder="Tell us about yourself"
                                    minlength="8"
                                ></textarea>
                            </div>
                        </div>

                        <div class="checkout__amount">
                            <h1 class="checkout__payment-heading">Payment</h1>
                            <div class="checkout__payment">
                                <div class="form-check">
                                    <input
                                        id="banking"
                                        name="paymentMethod"
                                        type="radio"
                                        class="form-check-input"
                                        checked=""
                                        required=""
                                        value="1"
                                    />
                                    <label
                                        class="form-check-label"
                                        for="banking"
                                        >Banking</label
                                    >
                                </div>
                                <div class="form-check">
                                    <input
                                        id="cash"
                                        name="paymentMethod"
                                        type="radio"
                                        class="form-check-input"
                                        required=""
                                        value="2"
                                    />
                                    <label class="form-check-label" for="cash"
                                        >Cash</label
                                    >
                                </div>
                            </div>

                            <h2 class="checkout__order">Your order</h2>
                            <div class="checkout__row checkout__row-1">
                                <p class="checkout__row-price">
                                    Original Price
                                </p>
                                <p class="checkout__row-price">
                                    $${requestScope.TOTAL_AMOUNT}
                                </p>
                            </div>
                            <div class="checkout__row">
                                <p class="checkout__row-price">Savings</p>
                                <p class="checkout__row-price">$0</p>
                            </div>
                            <div class="checkout__row">
                                <p class="checkout__row-price">Shipping</p>
                                <p class="checkout__row-price">FREE</p>
                            </div>
                            <div class="checkout__row checkout__row-2">
                                <p class="checkout__row-price">
                                    Estimated Sales Tax
                                </p>
                                <p class="checkout__row-price">$0</p>
                            </div>
                            <div class="checkout__row checkout__row-3">
                                <p class="checkout__total">Total</p>
                                <p class="checkout__price">
                                    $${requestScope.TOTAL_AMOUNT}
                                </p>
                            </div>

                            <input
                                type="hidden"
                                name="action"
                                value="Payment"
                            />
                            <input
                                type="hidden"
                                name="totalAmount"
                                value="${requestScope.TOTAL_AMOUNT}"
                            />
                            <button class="btn checkout__btn" type="submit">
                                Place Order
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
        <c:import url="./footer.jsp" />
    </body>
</html>
