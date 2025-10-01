from flask import Blueprint, jsonify, current_app, render_template, redirect, url_for

reservas_bp = Blueprint("reservas", __name__, url_prefix="/reservas")

# 🔹 Redirigir al HTML con estilos


@reservas_bp.route('/', methods=['GET'])
def todas_reservas():
    return redirect(url_for('reservas.ver_reservas'))


# 🔹 Endpoint con estilos (HTML con Bootstrap)
@reservas_bp.route('/ver', methods=['GET'])
def ver_reservas():
    mysql = current_app.mysql
    cur = mysql.connection.cursor()
    cur.execute("SELECT id_reserva, fecha, hora, cant_personas, estado,"
                "cod_mesa FROM reservas")
    reservas = cur.fetchall()
    cur.close()

    return render_template("todas_reservas.html", reservas=reservas)


# 🔹 (Opcional) Endpoint API JSON si aún lo necesitas
@reservas_bp.route('/json', methods=['GET'])
def todas_reservas_json():
    mysql = current_app.mysql
    cur = mysql.connection.cursor()
    cur.execute("SELECT id_reserva, fecha, hora, cant_personas, estado,"
                "cod_mesa FROM reservas")
    reservas = cur.fetchall()
    cur.close()

    reservas_list = []
    for r in reservas:
        reservas_list.append({
            "id_reserva": r["id_reserva"],
            "fecha": str(r["fecha"]),
            "hora": str(r["hora"]),
            "cant_personas": r["cant_personas"],
            "estado": r["estado"],
            "cod_mesa": r["cod_mesa"]
        })

    return jsonify(reservas_list)
