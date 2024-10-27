from flask import Flask, render_template
from bosszp.web.dbutils import DBUtils
import json

app = Flask(__name__)

def get_db_conn():
    """
    获取数据库连接
    """
    return DBUtils(host='localhost', user='root', password='123456', db='job')

def msg(status, data='未加载到数据'):
    """
    返回格式化数据
    """
    return json.dumps({'status': status, 'data': data})

# 已有的接口

@app.route('/geteducation_salary')
def get_education_salary():
    """
    获取不同学历的平均薪资
    """
    db_conn = get_db_conn()
    results = db_conn.get_all(
        sql_str="""
                SELECT education, 
                       AVG((CAST(salary_lower AS UNSIGNED) + CAST(salary_high AS UNSIGNED)) / 2) as avg_salary
                FROM t_boss_zp_info
                GROUP BY education
                ORDER BY FIELD(education, '中专/中技', '高中', '大专', '本科', '硕士', '博士', '学历不限')
            """)

    if results is None or len(results) == 0:
        return msg(201)
    data = []
    for r in results:
        data.append({'name': r[0], 'value': float(r[1])})
    return msg(200, data)


@app.route('/get_salary_data')
def get_salary_data():
    """
    获取薪资数据用于可视化
    """
    db_conn = get_db_conn()
    results = db_conn.get_all("SELECT salary_lower, salary_high FROM t_boss_zp_info")

    if not results:
        return msg(201)

    salary_data = []
    for r in results:
        salary_data.append({'salary_lower': r[0], 'salary_high': r[1]})

    return msg(200, salary_data)
@app.route('/get_company_salary_ranking')
def get_company_salary_ranking():
    """
    获取公司薪资排行榜
    """
    db_conn = get_db_conn()
    results = db_conn.get_all(
        sql_str="SELECT com_name, AVG((CAST(salary_lower AS UNSIGNED) + CAST(salary_high AS UNSIGNED))/2) as avg_salary FROM t_boss_zp_info GROUP BY com_name ORDER BY avg_salary DESC LIMIT 10")
    if results is None or len(results) == 0:
        return msg(201)
    data = []
    for r in results:
        data.append({'name': r[0], 'value': float(r[1])})
    return msg(200, data)
@app.route('/')
def index():
    """
    渲染首页
    :return: index.html
    """
    return render_template('index2.html')
if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8226, debug=True)