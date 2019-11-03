<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Title</title>
    <style>
        .search{
            display: inline-block;
            padding:0;
            margin:0;
            border: 1px solid black;
            width:50%;
        }
        .c-btn{
            display: inline-block;
            color:green;
            background-color:palevioletred;
            margin-left:0;
            padding:3px 6px;
        }
        .form-search{
            margin: auto;
        }
        .left-col{
            height:100%;
            width:320px;
            background-color:black;
            position:fixed;
            z-index: 1;
            font-family: 'Courier New', Courier, monospace;
            color:white;
        }
        .right-col{
            position: relative;
            left:330px;
            width: calc(100% - 330px);
        }
        .one{
            height:70px;
            text-align: justify;
            overflow: auto;
        }
        #pre{
            display: none;
        }
        .right-product{
            padding:0;
        }
        #nav-color{
            color: white;
            background-color: black;
        }
        #nav-col{
            padding: 0;
        }

        .pro-sup{
            text-decoration: none;
            color: white;
            background: none;
            border: none;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div id="nav-col" class="col col-lg-12 col-md-12 col-sm-12">
            <nav id="nav-color" class="navbar">
                <h4>APTHAMITRA</h4>
                <form class="form-inline ml-auto">
                    <input type="text" name="search-value">
                    <button type="submit">Search</button>
                </form>
                <div style="display: flex;">
                    <form action="">
                        <input class="pro-sup" type="submit" value="PRODUCTS">
                    </form>
                    <form action="">
                        <input class="pro-sup" type="submit" value="SUPPORT">
                    </form>
                </div>
            </nav>
        </div>
    </div>
</div>
<div id="pre">
    <h4 id="preference" style="display: inline-block;color: grey;">PREFERENCE ></h4>
</div>
<div id="lefty" class="left-col text-center">
    <h5>CHANGE</h5>
    <h6>COLOR</h6>

    <form action="preference" method="post">
        <div class="one">
            <input type="checkbox" name="color" value="red"> RED <br>
            <input type="checkbox" name="color" value="pink"> PINK <br>
            <input type="checkbox" name="color" value="yellow"> YELLOW <br>
            <input type="checkbox" name="color" value="green"> GREEN <br>
            <input type="checkbox" name="color" value="white"> WHITE
        </div>
        <h6>CONNECTIVITY</h6>
        <div class="one">
            <input type="checkbox" name="connect" value="wired"> WIRED <br>
            <input type="checkbox" name="connect" value="wireless"> WIRELESS
        </div>
        <h6>AGE</h6>
        <div class="one">
            <input type="checkbox" name="age" value="10"> < 10years<br>
            <input type="checkbox" name="age" value="20"> 10-20 years <br>
            <input type="checkbox" name="age" value="30"> 20-30 years<br>
            <input type="checkbox" name="age" value="40"> 30-40 years <br>
            <input type="checkbox" name="age" value="50"> > 40 years
        </div>
        <h6>TYPE</h6>
        <div class="one">
            <input type="checkbox" name="type" value="onhear"> ON Hear<br>
            <input type="checkbox" name="type" value="overhear"> Over Hear <br>
        </div>
        <h6>MUSIC PREFERENCE</h6>
        <div class="one">
            <input type="checkbox" name="music" value="base"> BASE<br>
            <input type="checkbox" name="music" value="baseless"> BASELESS<br>
        </div>
        <button type="submit">GET</button>
    </form>
</div>

<div class="right-col">
    <div class="container-fluid">
        <div class="row">
            <!-- add java code
            <div class="right-product col">

            </div>
            -->
        </div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>