<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Home</title>

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
            <section class="hero">
                <div class="container">
                    <div class="hero__inner">
                        <!-- Hero media -->

                        <div class="hero__media">
                            <div class="hero__img-wrap">
                                <img
                                    src="./assets/img/hero.png"
                                    alt=""
                                    class="hero__img"
                                />
                            </div>

                            <!-- Decorations -->
                            <img
                                src="./assets/img/hero-decor-01.svg"
                                alt=""
                                class="hero-decor hero-decor__left"
                            />
                            <img
                                src="./assets/img/hero-decor-02.svg"
                                alt=""
                                class="hero-decor hero-decor__right"
                            />
                        </div>
                        <!-- Hero content -->
                        <section class="hero-content">
                            <h1 class="hero__heading">
                                Beauty You Want. Deals You Love.
                            </h1>
                            <p class="hero__desc">
                                We'll always bring you the best prices for your
                                beauty favorites.
                            </p>
                            <!-- <div class="hero__link">
                                <a
                                    href="#!"
                                    class="btn btn--primary hero__cta-btn"
                                    >Shop Now</a
                                >
                            </div> -->
                        </section>
                    </div>
                </div>
            </section>

            <c:import url="./footer.jsp" />
        </main>
    </body>
</html>
