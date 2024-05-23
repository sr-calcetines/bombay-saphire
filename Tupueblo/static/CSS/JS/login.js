//Verificar Credenciales
document.addEventListener('DOMContentLoaded', function () {
    var loginButton = document.getElementById('login-button');

    loginButton.addEventListener('click', function (event) {
        event.preventDefault();

        var usuario = document.getElementById('usuario').value;
        var contrasena = document.getElementById('contrasena').value;

        axios.post('login.php', {
            usuario: usuario,
            contrasena: contrasena
        })
        .then(function (response) {
            if (response.data === 'success') {
                alert('Inicio de sesión exitoso');
                window.location.href = 'panelAdmin.html';
            } else {
                alert('Credenciales incorrectas. Inténtalo de nuevo.');
            }
        })
        .catch(function (error) {
            console.error('Error al iniciar sesión:', error);
        });
    });
});
