<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
    <meta name="author" content="Abya">
    <meta name="keywords"
        content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

    <link rel="preconnect" href="https://fonts.gstatic.com">

    <link rel="stylesheet" href="/vendor/components/jqueryui/themes/smoothness/jquery-ui.min.css" />
    <link rel="stylesheet" href="/vendor/components/jqueryui/themes/smoothness/theme.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />

    <link rel="stylesheet" href="/public/module/adminkit/css/app.css" />
    <link rel="stylesheet" href="/public/module/adminkit/css/app.css">
    <script src="/public/module/adminkit/js/app.js"></script>


    <link rel="stylesheet" href="/public/styles.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap">

    <script src="/vendor/components/jquery/jquery.min.js"></script>
    <script src="/vendor/components/jqueryui/jquery-ui.min.js"></script>
    

    <link rel="stylesheet" href="/public/module/native-toast/dist/native-toast.css" />
    <script src="/public/module/native-toast/dist/native-toast.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>

    <title>Sign In | POS</title>
</head>

<body>
    <div class="wrapper">
        <div class="main">
            <div class="row vh-100">
                <div class="col-sm-10 col-md-8 col-lg-6 col-xl-5 mx-auto d-table h-100">
                    <div class="d-table-cell align-middle">

                        <div class="text-center mt-4">
                            <h1 class="h2">Welcome back!</h1>
                            <p class="lead">
                                Sign in to your account to continue
                            </p>
                        </div>

                        <div class="card w-75 mx-auto">
                            <div class="card-body">
                                <div class="m-sm-3">

                                {include file="../../components/form/login-form.tpl"}
                                </div>
                            </div>
                        </div>
                        <div class="text-center mb-3">
                            Don't have an account? <a href="{$base_url}register">Sign up</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

</html>