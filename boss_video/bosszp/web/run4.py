from flask import Flask, render_template
from bosszp.web.dbutils import DBUtils
import json

app = Flask(__name__)

def get_db_conn():
    return DBUtils(host='localhost', user='root', password='123456', db='job')

def msg(status, data='未加载到数据'):
    return json.dumps({'status': status, 'data': data})

@app.route('/get_industry_analysis')
def get_industry_analysis():
    db_conn = get_db_conn()
    results = db_conn.get_all(
        sql_str="""
            SELECT com_type,
                   AVG(CAST(REPLACE(salary_lower, 'k', '') AS UNSIGNED) * 1000 + 
                       CAST(REPLACE(salary_high, 'k', '') AS UNSIGNED) * 1000) / 2 AS avg_salary,
                   AVG(work_year) AS work_year,
                   com_size,
                   finance_stage
            FROM t_boss_zp_info
            GROUP BY com_type, com_size, finance_stage
            ORDER BY com_type
        """
    )

    if not results:
        return msg(201)

    data = []
    for r in results:
        data.append({
            'com_type': r[0],
            'avg_salary': float(r[1]) if r[1] is not None else 0,
            'work_year': float(r[2]) if r[2] is not None else 0,
            'com_size': r[3],
            'finance_stage': r[4]
        })

    return msg(200, data)

@app.route('/')
def index():
    return render_template('index4.html')

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8229, debug=True)
