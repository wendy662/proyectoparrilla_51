from flask import Blueprint, render_template

mesas_bp = Blueprint('mesas', __name__)

@mesas_bp.route('/mesas')
def mesas():
    return render_template('mesas.html')
