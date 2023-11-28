<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Sign Up</title>

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

        <div class="sign-up">
            <form class="sign-up_inner" action="MainController" method="POST">
                <a class="out" href="index.jsp"
                    ><img
                        src="./assets/img/Vector.jpg"
                        alt="index.css"
                        class="signup-out_img"
                /></a>
                <h2 class="heading">Sign Up</h2>
                <div class="signup__link">
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

                <p class="sign-up_break">OR</p>

                <div>
                    <h3 class="sub-title">User Name</h3>
                    <input
                        type="text"
                        name="username"
                        class="sign-up_input fullname"
                        placeholder="Your user name"
                    />
                </div>

                <div>
                    <h3 class="sub-title">Email</h3>
                    <input
                        type="text"
                        name="email"
                        class="sign-up_input firstname"
                        placeholder="Your email"
                    />
                </div>

                <div>
                    <h3 class="sub-title">Password</h3>
                    <input
                        type="password"
                        name="password"
                        class="sign-up_input lastname"
                        placeholder="Your password"
                    />
                </div>

                <div>
                    <input type="hidden" name="action" value="Register" />
                    <!-- value ????-->
                    <button type="submit" class="sign-up_button btn">
                        Sign Up
                    </button>
                </div>

                <p class="sign-up__account">
                    Have a account?
                    <a class="sign-up__link" href="login.jsp">Sign in</a>
                </p>
            </form>
        </div>
    </body>
</html>
