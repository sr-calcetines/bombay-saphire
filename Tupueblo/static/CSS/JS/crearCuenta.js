//Crear cuenta
document.addEventListener('DOMContentLoaded', function () {
    var crearCuentaButton = document.getElementById('crear-cuenta-button');

    crearCuentaButton.addEventListener('click', function () {
        var nuevoUsuario = document.getElementById('nuevo-usuario').value;
        var nuevaContrasena = document.getElementById('nueva-contrasena').value;

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "crearCuenta.php", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                alert(xhr.responseText);
            }
        };
        xhr.send("nuevo-usuario=" + nuevoUsuario + "&nueva-contrasena=" + nuevaContrasena);
    });
});
