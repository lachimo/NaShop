<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Sign In</title>

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
        <main class="signin">
            <div class="signin__inner">
                <section class="signin-left">
                    <div class="signin-left__inner">
                        <!-- <h1 class="heading">Welcome to Nane Shop</h1>
                        <p class="left_desc">Sign in to enjoy your time ^v^</p> -->
                        <img
                            src="./assets/img/bg_img_2.jpg"
                            alt=""
                            class="signin-left__background"
                        />
                    </div>
                </section>

                <section class="signin-right">
                    <form
                        class="signin-right__inner"
                        action="MainController"
                        method="POST"
                    >
                        <a class="out" href="index.jsp"
                            ><img
                                src="./assets/img/Vector.jpg"
                                alt="index.css"
                                class="signin-out_img"
                        /></a>

                        <h2 class="heading">Sign In</h2>
                        <div>
                            <h3 class="sub-title">User name</h3>
                            <input
                                type="text"
                                class="signin-right__input username"
                                placeholder="Input your user name"
                                name="username"
                                required=""
                            />
                        </div>

                        <div>
                            <h3 class="sub-title">Password</h3>
                            <input
                                type="password"
                                class="signin-right__input password"
                                placeholder="Input your password"
                                name="password"
                                required=""
                            />
                        </div>

                        <div>
                            <input type="hidden" name="action" value="Login" />
                            <button type="submit" class="signin-button btn">
                                Sign In
                            </button>
                        </div>

                        <p class="signin-right__break">OR</p>
                        <div class="signin-right__link">
                            <a
                                href="https://accounts.google.com/o/oauth2/auth?scope=profile%20email&redirect_uri=http://localhost:8084/NaneShop/MainController?action=Google&response_type=code&client_id=718599949553-4psn05508f3lkfo7so3qk2rrhj5bfa73.apps.googleusercontent.com&approval_prompt=force"
                                class="link-gg"
                            >
                                <img
                                    src="./assets/img/google.svg"
                                    alt=""
                                    class="gg-img"
                                />
                                <p class="con-gg">Continue with Google</p>
                            </a>
                        </div>

                        <p class="signin-account">
                            Don't have account?
                            <a class="signin-link" href="register.jsp"
                                >Sign up</a
                            >
                        </p>
                    </form>
                </section>
            </div>
        </main>
    </body>
</html>
