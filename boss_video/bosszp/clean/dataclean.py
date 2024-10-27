# -*- coding:utf-8 -*-
"""
    作者：jhzhong
    功能：对岗位数据进行清洗与预处理
    需求：
        1. 读取 `全国-热门城市岗位数据.csv` 文件
        2. 对重复行进行清洗。
        3. 对`工作地址`字段进行预处理。要求：北京·海淀区·西北旺 --> 北京，海淀区，西北旺。分隔成3个字段
        4. 对`薪资`字段进行预处理。要求：30-60K·15薪 --> 最低：30，最高：60
        5. 对`工作经验`字段进行预处理。要求：经验不限/在校/应届 ：0，1-3年：1，3-5年：2，5-10年：3，10年以上:4
        6. 对`企业规模`字段进行预处理。要求：500人以下：0，500-999：1，1000-9999：2，10000人以上：3
        7. 对`岗位福利`字段进行预处理。要求：将描述中的中文'，'（逗号）,替换成英文','（逗号）
        8. 对缺失值所在行进行清洗。
        9. 将处理后的数据保存到 MySQL 数据库
"""
# 导入模块
import pandas as pd
from sqlalchemy import create_engine
import logging

# 读取 全国-热门城市岗位招聘数据.csv 文件
all_city_zp_df = pd.read_csv('../../boss_data_python.csv', encoding='utf8')

# 对重复行进行清洗。
# all_city_zp_df.drop_duplicates(inplace=True)

# 对`工作地址`字段进行预处理。要求：北京·海淀区·西北旺 --> 北京，海淀区，西北旺。分隔成3个字段
# all_city_zp_area_df = all_city_zp_df['job_area'].str.split(' ', expand=True)
# all_city_zp_area_df = all_city_zp_area_df.rename(columns={0: "city", 1: "district", 2: "street"})
all_city_zp_area_df = all_city_zp_df['job_area'].str.split(" ", expand=True)

# 动态重命名列，只有一列时只命名为 city，两列时命名为 city 和 district，三列时命名为 city, district 和 street
if all_city_zp_area_df.shape[1] == 1:
    all_city_zp_area_df = all_city_zp_area_df.rename(columns={0: "city"})
elif all_city_zp_area_df.shape[1] == 2:
    all_city_zp_area_df = all_city_zp_area_df.rename(columns={0: "city", 1: "district"})
else:
    all_city_zp_area_df = all_city_zp_area_df.rename(columns={0: "city", 1: "district", 2: "street"})

# 对`薪资`字段进行预处理。要求：30-60K·15薪 --> 最低：30，最高：60
all_city_zp_salary_df = all_city_zp_df['job_salary'].str.split('K', expand=True)[0].str.split('-', expand=True)
all_city_zp_salary_df = all_city_zp_salary_df.rename(columns={0: 'salary_lower', 1: 'salary_high'})


# 对`工作经验`字段进行预处理。要求：经验不限/在校/应届 ：0，1-3年：1，3-5年：2，5-10年：3，10年以上:4
def fun_work_year(x):
    if x == "1-3年":
        return 1
    elif x == "3-5年":
        return 2
    elif x == "5-10年":
        return 3
    elif x == "10年以上":
        return 4
    elif x == "1年以内":
        return 5
    elif x == "应届生":
        return 6
    elif x == "经验不限":
        return 7
    else:
        return 0


all_city_zp_df['work_year'] = all_city_zp_df['work_year'].apply(lambda x: fun_work_year(x))


# 对`企业规模`字段进行预处理。要求：500人以下：0，500-999：1，1000-9999：2，10000人以上：3
def fun_com_size(x):
    if x == '0-20人':
        return 1
    elif x == '20-99人':
        return 2
    elif x == '100-499人':
        return 3
    elif x == '500-999人':
        return 4
    elif x == '1000-9999人':
        return 5
    else:
        return 0



# 合并所有数据集
clean_all_city_zp_df = pd.concat([all_city_zp_df, all_city_zp_salary_df, all_city_zp_area_df], axis=1)

# 删除冗余列
clean_all_city_zp_df.drop('job_area', axis=1, inplace=True)  # 删除原区域
clean_all_city_zp_df.drop('job_salary', axis=1, inplace=True)  # 删除原薪资

# 删除 `job_benefits` 列，避免写入数据库
clean_all_city_zp_df.drop('job_benefits', axis=1, inplace=True)

# 对缺失值所在行进行清洗。
clean_all_city_zp_df.dropna(axis=0, how='any', inplace=True)

# 将处理后的数据保存到 MySQL 数据库
engine = create_engine('mysql+pymysql://root:123456@localhost:3306/job?charset=utf8')
clean_all_city_zp_df.to_sql('t_boss_zp_info_python', con=engine, if_exists='replace')

logging.info("Write to MySQL Successfully!")
