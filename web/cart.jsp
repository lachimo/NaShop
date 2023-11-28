<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Cart</title>
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
            <c:if test="${not empty sessionScope.ITEM_LIST}">
                <main>
                    <section class="cart">
                        <div class="container">
                            <div class="cart__inner">
                                <h1 class="cart__heading">Shopping Cart</h1>

                                <!-- Item 1 -->
                                <c:forEach
                                    var="item"
                                    items="${sessionScope.ITEM_LIST}"
                                >
                                    <c:set
                                        var="totalAmount"
                                        scope="page"
                                        value="${totalAmount + (item.quantity * item.product.price)}"
                                    />
                                    <form action="MainController" method="POST">
                                        <article class="cart__list">
                                            <section class="cart__item">
                                                <c:url
                                                    var="delete"
                                                    value="MainController"
                                                >
                                                    <c:param
                                                        name="action"
                                                        value="DeleteItem"
                                                    />
                                                    <c:param name="productId" value="${item.product.productId}"/>
                                                    <c:param name="cartId" value="${item.cart.cartId}"/>
                                                </c:url>
                                                
                                                <a
                                                    href="${delete}"
                                                    class="cart__delete"
                                                >
                                                    <svg
                                                        xmlns="http://www.w3.org/2000/svg"
                                                        height="20"
                                                        viewBox="0 0 448 512"
                                                    >
                                                        <path
                                                            d="M135.2 17.7L128 32H32C14.3 32 0 46.3 0 64S14.3 96 32 96H416c17.7 0 32-14.3 32-32s-14.3-32-32-32H320l-7.2-14.3C307.4 6.8 296.3 0 284.2 0H163.8c-12.1 0-23.2 6.8-28.6 17.7zM416 128H32L53.2 467c1.6 25.3 22.6 45 47.9 45H346.9c25.3 0 46.3-19.7 47.9-45L416 128z"
                                                        />
                                                    </svg>
                                                </a>

                                                    <input type="hidden" name="cartId" value="${item.cart.cartId}"/>
                                                    <input type="hidden" name="productId" value="${item.product.productId}"/>
                                                <button
                                                    type="submit"
                                                    name="action"
                                                    value="UpdateItem"
                                                    class="cart__edit"
                                                >
                                                    <svg
                                                        xmlns="http://www.w3.org/2000/svg"
                                                        height="22"
                                                        viewBox="0 0 512 512"
                                                    >
                                                        <path
                                                            d="M471.6 21.7c-21.9-21.9-57.3-21.9-79.2 0L362.3 51.7l97.9 97.9 30.1-30.1c21.9-21.9 21.9-57.3 0-79.2L471.6 21.7zm-299.2 220c-6.1 6.1-10.8 13.6-13.5 21.9l-29.6 88.8c-2.9 8.6-.6 18.1 5.8 24.6s15.9 8.7 24.6 5.8l88.8-29.6c8.2-2.7 15.7-7.4 21.9-13.5L437.7 172.3 339.7 74.3 172.4 241.7zM96 64C43 64 0 107 0 160V416c0 53 43 96 96 96H352c53 0 96-43 96-96V320c0-17.7-14.3-32-32-32s-32 14.3-32 32v96c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V160c0-17.7 14.3-32 32-32h96c17.7 0 32-14.3 32-32s-14.3-32-32-32H96z"
                                                        />
                                                    </svg>
                                                </button>
                                                <div class="cart__item-image">
                                                    <img
                                                        src="${item.product.imageURL}"
                                                        alt=""
                                                        class="cart__image"
                                                    />
                                                </div>
                                                <h2 class="cart__item-title">
                                                    ${item.product.productName}
                                                </h2>
                                            </section>
                                            <div class="cart__item-content">
                                                <p class="cart__price">
                                                    Price:
                                                    <strong class="price"
                                                        >$${item.product.price}</strong
                                                    >
                                                </p>
                                                <div class="cart__quantity">
                                                    <button
                                                        type="button"
                                                        class="cart__minus"
                                                    >
                                                        <svg
                                                            class="cart__plus-icon"
                                                            width="20"
                                                            height="20"
                                                            viewBox="0 0 16 16"
                                                            fill="none"
                                                            xmlns="http://www.w3.org/2000/svg"
                                                        >
                                                            <path
                                                                d="M4 8H12"
                                                                stroke="currentColor"
                                                                stroke-linecap="round"
                                                                stroke-linejoin="round"
                                                            />
                                                        </svg>
                                                    </button>

                                                    <input
                                                        class="cart__number"
                                                        type="number"
                                                        value="${item.quantity}"
                                                        min="1"
                                                        max="${item.product.quantity}"
                                                        name="quantity"
                                                    />
                                                    <button
                                                        type="button"
                                                        class="cart__plus"
                                                    >
                                                        <svg
                                                            class="cart__plus-icon"
                                                            width="20"
                                                            height="20"
                                                            viewBox="0 0 16 16"
                                                            fill="none"
                                                            xmlns="http://www.w3.org/2000/svg"
                                                        >
                                                            <path
                                                                d="M4 8H12"
                                                                stroke="currentColor"
                                                                stroke-linecap="round"
                                                                stroke-linejoin="round"
                                                            />
                                                            <path
                                                                d="M8 12V4"
                                                                stroke="currentColor"
                                                                stroke-linecap="round"
                                                                stroke-linejoin="round"
                                                            />
                                                        </svg>
                                                    </button>
                                                </div>
                                                <fmt:formatNumber
                                                    value="${item.quantity * item.product.price}"
                                                    pattern="#0.00"
                                                    var="formattedTotal"
                                                />
                                                <p class="cart__total-price">
                                                    Total:
                                                    <strong class="price"
                                                        >$${formattedTotal}</strong
                                                    >
                                                </p>
                                            </div>
                                        </article>
                                    </form>
                                </c:forEach>
                            </div>
                            <div class="cart__footer">
                                <c:url var="productUrl" value="MainController">
                                    <c:param name="action" value="Product" />
                                </c:url>
                                <a
                                    href="${productUrl}"
                                    class="cart__footer-right"
                                    >Continues shopping</a
                                >
                                <fmt:formatNumber
                                    value="${totalAmount}"
                                    pattern="#0.00"
                                    var="formattedTotalAmount"
                                />

                                <c:url var="checkout" value="MainController">
                                    <c:param name="action" value="Checkout" />
                                    <c:param
                                        name="totalAmount"
                                        value="${formattedTotalAmount}"
                                    />
                                </c:url>
                                <div class="cart__footer-left">
                                    <a
                                        href="${checkout}"
                                        class="footer-checkout btn"
                                    >
                                        <span class="footer-checkout-1"
                                            >Checkout</span
                                        >
                                        |
                                        <span class="footer-checkout-2"
                                            >$${formattedTotalAmount}</span
                                        >
                                    </a>
                                </div>
                            </div>
                        </div>
                    </section>
                </main>
            </c:if>
            <c:if test="${empty sessionScope.ITEM_LIST}">
                <main>
                    <section class="cart">
                        <div class="container">
                            <h1 class="cart__heading">
                                Enjoy and buy something
                            </h1>
                        </div>
                    </section>
                </main>
            </c:if>
        </main>
        <c:import url="./footer.jsp" />

        <script src="./assets/js/cart.js"></script>
    </body>
</html>
