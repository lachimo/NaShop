<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Smaller</title>

        <!-- Embed Reset -->
        <link rel="stylesheet" href="./assets/css/reset.css" />

        <!-- Embed Fonts -->
        <link rel="preconnect" href="https://fonts.cdnfonts.com" />
        <link
            href="https://fonts.cdnfonts.com/css/roobert?styles=49579,49577,49581"
            rel="stylesheet"
        />

        <!-- Embed Style -->
        <link rel="stylesheet" href="./assets/css/main.css" />
    </head>

    <body>
        <c:if
            test="${sessionScope.ROLE_ID == null || sessionScope.ROLE_ID ne 'US'}"
        >
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <article class="invoice">
            <div class="container">
                <div class="invoice__inner">
                    <a class="out" href="index.jsp"
                        ><img src="./assets/img/x.svg" alt=""
                    /></a>
                    <div class="invoice__header">
                        <div class="invoice__logo">
                            <img
                                src="./assets/img/logo.jpg"
                                alt=""
                                class="invoice-image"
                            />
                        </div>
                        <div class="invoice__header-content">
                            <p class="invoice__header-desc">Invoice # A9XYZ</p>
                            <p class="invoice__header-desc">Smaller company</p>
                            <p class="invoice__header-desc">Hochiminh city</p>
                        </div>
                    </div>
                    <h1 class="invoice__heading">
                        The information you need to know
                    </h1>
                    <p class="invoice__content">
                        Thank you for your purchase and for taking the time to
                        support our products. We sincerely hope that you will
                        continue to support us and be satisfied with our
                        products. If you encounter any difficulties or issues,
                        please feel free to contact us through the following
                        channels.
                    </p>
                    <div class="invoice__footer">
                        <div class="invoice__payment">
                            <h2 class="invoice__payment-heading">Payment</h2>
                            <p class="invoice__payment-desc">
                                Momo: 0934600600
                            </p>
                            <p class="invoice__payment-desc">
                                Cash when receiving the goods.
                            </p>
                            <p class="invoice__payment-desc">
                                MB bank: 0934600600
                            </p>
                        </div>
                        <div class="invoice__contact">
                            <h2 class="invoice__contact-heading">Contact</h2>
                            <p class="invoice__contact-desc">
                                Phone: 0934600600
                            </p>
                            <p class="invoice__contact-desc">
                                Email: Smaller@gmail.com
                            </p>
                            <p class="invoice__contact-desc">
                                Facebook: SmallerShop
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </body>
</html>
