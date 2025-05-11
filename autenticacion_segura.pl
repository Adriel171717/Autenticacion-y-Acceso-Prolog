% usuario(NombreUsuario, Contraseña, Permisos).
usuario(admin, 'admin123', alto).
usuario(juan, 'juan456', medio).
usuario(maria, 'maria789', bajo).

% intento_fallido(NombreUsuario, Hora).
intento_fallido(admin, '10:01').
intento_fallido(admin, '10:02').
intento_fallido(admin, '10:03').
intento_fallido(admin, '10:04').
intento_fallido(admin, '10:05').

% Autenticación básica
autenticar(NombreUsuario, Contraseña) :- usuario(NombreUsuario, Contraseña, _),
    write('Acceso concedido al usuario: '), write(NombreUsuario), nl.

% Detectar posible ataque por fuerza bruta
posible_fuerza_bruta(NombreUsuario) :- findall(Hora, intento_fallido(NombreUsuario, Hora), Intentos),
    length(Intentos, N),
    N >= 5,
    write('Posible ataque de fuerza bruta detectado para usuario: '),
    write(NombreUsuario), nl.

% Sugerir bloqueo
sugerir_bloqueo(NombreUsuario) :- posible_fuerza_bruta(NombreUsuario),
    write('Sugerencia: Bloquear temporalmente al usuario.'), nl.


% Para provar despues

% ?- autenticar(juan, 'juan456').
% ?- posible_fuerza_bruta(admin).
% ?- sugerir_bloqueo(admin).
