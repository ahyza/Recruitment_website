from flask import Flask, render_template, jsonify
from bosszp.web.dbutils import DBUtils

app = Flask(__name__)

def get_db_conn():
    return DBUtils(host='localhost', user='root', password='123456', db='job')

@app.route('/get_company_size_distribution')
def get_company_size_distribution():
    db_conn = get_db_conn()
    results = db_conn.get_all(
        sql_str="SELECT com_size, COUNT(1) FROM t_boss_zp_info GROUP BY com_size"
    )
    if results is None or len(results) == 0:
        return jsonify(status=201, data=[])

    data = [{'name': r[0], 'y': r[1]} for r in results]
    return jsonify(status=200, data=data)

@app.route('/get_salary_vs_company_size')
def get_salary_vs_company_size():
    db_conn = get_db_conn()
    results = db_conn.get_all(
        sql_str="SELECT com_size, AVG((CAST(salary_lower AS UNSIGNED) + CAST(salary_high AS UNSIGNED)) / 2) as avg_salary FROM t_boss_zp_info GROUP BY com_size"
    )
    if results is None or len(results) == 0:
        return jsonify(status=201, data=[], categories=[])

    categories = [r[0] for r in results]
    data = [float(r[1]) for r in results]
    return jsonify(status=200, data=data, categories=categories)

@app.route('/get_company_type_distribution')
def get_company_type_distribution():
    db_conn = get_db_conn()
    results = db_conn.get_all(
        sql_str="SELECT com_type, COUNT(1) FROM t_boss_zp_info GROUP BY com_type"
    )
    if results is None or len(results) == 0:
        return jsonify(status=201, data=[])

    data = [{'name': r[0], 'y': r[1]} for r in results]
    return jsonify(status=200, data=data)

@app.route('/get_job_market_analysis')
def get_job_market_analysis():
    db_conn = get_db_conn()
    results = db_conn.get_all(
        sql_str="SELECT city, COUNT(1) as job_count FROM t_boss_zp_info GROUP BY city ORDER BY job_count DESC"
    )
    if results is None or len(results) == 0:
        return jsonify(status=201, data=[], categories=[])

    categories = [r[0] for r in results]
    data = [r[1] for r in results]
    return jsonify(status=200, data=data, categories=categories)

@app.route('/')
def index():
    """
    渲染首页
    :return: index.html
    """
    return render_template('index3.html')

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8227, debug=True)
