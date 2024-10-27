from flask import Flask, render_template, jsonify
from bosszp.web.dbutils import DBUtils

app = Flask(__name__)

def get_db_conn():
    return DBUtils(host='localhost', user='root', password='123456', db='job')


# 1. 城市或区域维度的学历要求分析
@app.route('/get_education_city_distribution')
def get_education_city_distribution():
    db_conn = get_db_conn()
    results = db_conn.get_all(
        sql_str="SELECT city, education, COUNT(1) as count FROM t_boss_zp_info GROUP BY city, education"
    )
    if results is None or len(results) == 0:
        return jsonify(status=201, data=[])

    data = [{'city': r[0], 'education': r[1], 'count': r[2]} for r in results]
    return jsonify(status=200, data=data)


# 学历与平均薪资的关系
@app.route('/get_education_salary_relation')
def get_education_salary_relation():
    db_conn = get_db_conn()
    # 查询不同学历的平均薪资
    results = db_conn.get_all(
        sql_str="SELECT education, AVG((CAST(salary_lower AS UNSIGNED) + CAST(salary_high AS UNSIGNED)) / 2) as avg_salary FROM t_boss_zp_info GROUP BY education"
    )
    if results is None or len(results) == 0:
        return jsonify(status=201, data=[], categories=[])

    categories = [r[0] for r in results]  # 学历
    data = [float(r[1]) for r in results]  # 平均薪资
    return jsonify(status=200, data=data, categories=categories)

# 3. 学历与工作经验的关系
@app.route('/get_education_work_year')
def get_education_work_year():
    db_conn = get_db_conn()
    results = db_conn.get_all(
        sql_str="SELECT education, AVG(work_year) as avg_work_year FROM t_boss_zp_info GROUP BY education"
    )
    if results is None or len(results) == 0:
        return jsonify(status=201, data=[], categories=[])

    categories = [r[0] for r in results]
    data = [float(r[1]) for r in results]
    return jsonify(status=200, data=data, categories=categories)


# 学历与公司类型的关系
@app.route('/get_education_company_type_relation')
def get_education_company_type_relation():
    db_conn = get_db_conn()
    # 查询学历与公司类型的关系
    results = db_conn.get_all(
        sql_str="SELECT education, com_type, COUNT(1) as count FROM t_boss_zp_info GROUP BY education, com_type"

    )
    if results is None or len(results) == 0:
        return jsonify(status=201, data=[], categories=[])

    categories = list(set([r[0] for r in results]))  # 去重的学历列表
    company_types = list(set([r[1] for r in results]))  # 去重的公司类型列表

    # 构造数据格式
    data = []
    for com_type in company_types:
        data.append({
            'name': com_type,
            'data': [r[2] if r[1] == com_type else 0 for r in results]  # 统计每个公司类型与学历的关系
        })

    return jsonify(status=200, data=data, categories=categories)



@app.route('/')
def index():
    return render_template('index5.html')

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8230, debug=True)
