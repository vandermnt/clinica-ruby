<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <!-- <link rel="icon" href="../../../../favicon.ico"> -->

  <title> São Lucas Clínica</title>

  <!-- Bootstrap core CSS -->
  <link href="/css/bootstrap.min.css" rel="stylesheet">
  <link href="/css/login.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/css/signin.css" rel="stylesheet">
</head>

<body class="text-center" style="background-color:#086A87">
  <form class="form-signin" method="POST" action="{{ route('register') }}">

    {{ csrf_field() }}


    <img class="mb-4" src="/img/userAdd.png" alt="" width="100" height="100">
    <div class="form-group col-md-20">

      <input id="name" type="text" placeholder="Nome" class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="name" value="{{ old('name') }}" required autofocus>

      @if ($errors->has('name'))
      <span class="invalid-feedback">
        <strong>{{ $errors->first('name') }}</strong>
      </span>
      @endif      <label for="inputPassword" class="sr-only">Password</label>
    </div>
    <div class="form-group col-md-20">

      <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" placeholder="E-mail" required>

      @if ($errors->has('email'))
      <span class="invalid-feedback">
        <strong>O email deve ser um endereço de email válido.</strong>
      </span>
      @endif
    </div>
        <div class="form-group col-md-20">

          <input id="password" type="password" placeholder="Senha" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required>

          @if ($errors->has('password'))
          <span class="invalid-feedback">
            <strong>A confirmação da senha não corresponde.</strong>
          </span>
          @endif
        </div>
        <div class="form-group col-md-20">


          <input id="password-confirm" type="password" class="form-control" name="password_confirmation" placeholder="Confirme sua senha" required>
        </div>


        <br>
        <button type="submit" class="btn btn-success btn-lg btn-block"> <b>Registrar</b> </button>

        <p class="mt-5 mb-3 text-muted">&copy; Clínica São Lucas</p>

      </form>
    </body>
    </html>
