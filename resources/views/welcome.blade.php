<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Laravel</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">

        <!-- Styles -->
        <style>
            html, body {
                background-color: #fff;
                color: #636b6f;
                font-family: 'Nunito', sans-serif;
                font-weight: 200;
                height: 100vh;
                margin: 0;
            }

            .full-height {
                height: 100vh;
            }

            .flex-center {
                align-items: center;
                display: flex;
                justify-content: center;
            }

            .position-ref {
                position: relative;
            }

            .top-right {
                position: absolute;
                right: 10px;
                top: 18px;
            }

            .content {
                text-align: center;
            }

            .title {
                font-size: 84px;
            }

            .links > a {
                color: #636b6f;
                padding: 0 25px;
                font-size: 13px;
                font-weight: 600;
                letter-spacing: .1rem;
                text-decoration: none;
                text-transform: uppercase;
            }

            .m-b-md {
                margin-bottom: 30px;
            }
        </style>
    </head>
    <body>
        <div class="flex-center position-ref full-height">
            @if (Route::has('login'))
                <div class="top-right links">
                    @auth
                        <a href="{{ url('/home') }}">Home</a>
                    @else
                        <a href="{{ route('login') }}">Login</a>

                        @if (Route::has('register'))
                            <a href="{{ route('register') }}">Register</a>
                        @endif
                    @endauth
                </div>
            @endif

            <div class="content">
                <div class="title m-b-md">
                    Laravel
                </div>

                <div class="links">
                    <a href="https://laravel.com/docs">Docs</a>
                    <a href="https://laracasts.com">Laracasts</a>
                    <a href="https://laravel-news.com">News</a>
                    <a href="https://blog.laravel.com">Blog</a>
                    <a href="https://nova.laravel.com">Nova</a>
                    <a href="https://forge.laravel.com">Forge</a>
                    <a href="https://vapor.laravel.com">Vapor</a>
                    <a href="https://github.com/laravel/laravel">GitHub</a>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript" src="http://127.0.0.1:9380/vendor/laravel-admin/AdminLTE/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script type="text/javascript">
        $.ajax({
            url: 'http://www.blandal.com/api/service/release',
            type: 'post',
            headers: {
                "bearer": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImp0aSI6ImFiYyJ9.eyJpc3MiOiJcdThkZDFcdThkZDFcdTY3MmNcdTU3MzBcdTY3MGRcdTUyYTEiLCJhdWQiOiJcdThkZDFcdThkZDFcdTY3MmNcdTU3MzBcdTY3MGRcdTUyYTEiLCJqdGkiOiJhYmMiLCJpYXQiOjE1OTQyODY3MzcsImV4cCI6MTU5Njg3ODczNywibmJmIjoxNTk0Mjg2NzM3LCJpZCI6MSwicGFyZW50IjowLCJjaGFpbiI6bnVsbCwib3BlbmlkIjoic2RmbGtqd2Vyandrc2Zpd3VpcnV3ZXIiLCJsZXZlbCI6MCwic2NvcmUiOjEwLCJuYW1lIjpudWxsLCJuaWNrbmFtZSI6InRlc3QiLCJhdmF0YXIiOm51bGwsInNleCI6MCwidGVscGhvbmUiOm51bGwsInN0YXR1cyI6MSwiY3JlYXRlZF9hdCI6IjIwMjAtMDYtMzBUMDA6MDA6MDAuMDAwMDAwWiIsInVwZGF0ZWRfYXQiOiIyMDIwLTA3LTA5VDA5OjI1OjM3LjAwMDAwMFoifQ.Wd5OiAdqq1pgH-V9bmfrcHeMbv9YEhS2jeuiJamCxLI"
            },
            dataType: "json",
            data: {
                "title": "wewer",
                "unit": "收到反馈世纪福克斯经典福克斯警方跨世纪福克斯净空法师大法师开发看手机",
                "phone": "12348",
                "keyword": "sdfkskdjskdfjskldjfkwjerkweioruweiuioweuriwej"
            },
            success: function(r){
                console.log(r);
            }
        });
    </script>
</html>
