% Declarar que `hecho/1` es un predicado dinámico
:- dynamic hecho/1.
% retractall(hecho(_)).  % Limpia todos los hechos

hecho(alta_tasa_intentos_login).
hecho(misma_ip_repetida).
% hecho(cpu_alta).
% hecho(memoria_alta).
hecho(usuarios_inexistentes_detectados).
% hecho(tokens_invalidos).
% hecho(tiempo_respuesta_lento).

% Regla 1: Fuerza bruta
regla(posible_fuerza_bruta) :-
    hecho(alta_tasa_intentos_login),
    hecho(misma_ip_repetida),
    hecho(usuarios_inexistentes_detectados).

% Regla 2: Ataque DDoS
regla(posible_ddos) :-
    hecho(alta_tasa_intentos_login),
    hecho(tokens_invalidos),
    hecho(tiempo_respuesta_lento).

% Regla 3: Sobrecarga legítima
regla(posible_sobrecarga_legitima) :-
    hecho(cpu_alta),
    hecho(memoria_alta),
    hecho(usuarios_legitimos_activos).

% Regla 4: Servidor requiere escalar
regla(requiere_escalado) :-
    hecho(cpu_alta),
    hecho(memoria_alta),
    hecho(tiempo_respuesta_lento).