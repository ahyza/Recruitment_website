$(document).ready(function() {

    // 1. 城市或区域维度的学历要求分析 (热力图)
    $.getJSON('/get_education_city_distribution', function(response) {
        if (response.status === 200) {
            let categoriesCity = [];
            let categoriesEducation = [];
            let data = [];

            response.data.forEach(function(item) {
                if (!categoriesCity.includes(item.city)) {
                    categoriesCity.push(item.city);
                }
                if (!categoriesEducation.includes(item.education)) {
                    categoriesEducation.push(item.education);
                }
                data.push([categoriesCity.indexOf(item.city), categoriesEducation.indexOf(item.education), item.count]);
            });

            Highcharts.chart('education_city_distribution', {
                chart: {
                    type: 'heatmap'
                },
                title: {
                    text: '城市/区域维度的学历要求分析'
                },
                                                 credits: {
    enabled: false
},

                xAxis: {
                    categories: categoriesCity,
                    title: {
                        text: '城市'
                    }
                },
                yAxis: {
                    categories: categoriesEducation,
                    title: {
                        text: '学历'
                    },
                                                     credits: {
    enabled: false
},

                },
                colorAxis: {
                    min: 0,
                    stops: [[0, '#ffffff'], [0.5, '#00ff00'], [1, '#ff0000']]
                },
                series: [{
                    name: '职位数',
                    borderWidth: 1,
                    data: data,
                    dataLabels: {
                        enabled: true,
                        color: '#000000'
                    }
                }]
            });
        }
    });

    // 学历与平均薪资的关系
    $.ajax({
        type: "GET",
        url: "/get_education_salary_relation",
        success: function(response) {
            if (response.status === 201) {
                alert("没有找到学历与薪资的相关数据");
                return;
            }

            // 构建柱状图数据
            Highcharts.chart('education_salary_chart', {
                chart: {
                    type: 'column'
                },
                title: {
                    text: '学历与平均薪资的关系'
                },
                                                 credits: {
    enabled: false
},

                xAxis: {
                    categories: response.categories,  // 学历
                    title: {
                        text: '学历'
                    }
                },
                yAxis: {
                    title: {
                        text: '平均薪资 (元)'
                    }
                },
                series: [{
                    name: '平均薪资',
                    data: response.data  // 平均薪资数据
                }]
            });
        },
        error: function() {
            alert("加载学历与薪资数据时出错");
        }
    });

    // 3. 学历与工作经验的关系 (散点图)
    $.getJSON('/get_education_work_year', function(response) {
        if (response.status === 200) {
            let seriesData = [];

            response.categories.forEach(function(education, index) {
                seriesData.push([index, response.data[index]]);
            });

            Highcharts.chart('education_work_year_distribution', {
                chart: {
                    type: 'scatter'
                },
                title: {
                    text: '学历与工作经验的关系'
                },
                                                 credits: {
    enabled: false
},

                xAxis: {
                    categories: response.categories,
                    title: {
                        text: '学历'
                    }
                },
                yAxis: {
                    title: {
                        text: '平均工作年限 (年)'
                    }
                },
                series: [{
                    name: '学历 vs 工作年限',
                    data: seriesData,
                    marker: {
                        radius: 5
                    }
                }]
            });
        }
    });
// 学历与公司类型的关系
     $.ajax({
            type: "GET",
            url: "/get_education_company_type_relation",
            success: function (response) {
                if (response.status === 201) {
                    alert("没有找到学历与公司类型的相关数据");
                    return;
                }

                // 构建堆叠柱状图数据
                Highcharts.chart('education_company_type_chart', {
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: '学历与公司类型的关系'
                    },
                    credits: {
                        enabled: false
                    },
                    xAxis: {
                        categories: response.categories,  // 学历
                        title: {
                            text: '学历'
                        }
                    },
                    yAxis: {
                        min: 0,
                        title: {
                            text: '学历数量'
                        },
                        labels: {
                            rotation: -45,  // 旋转 y 轴标签
                            formatter: function () {
                                return this.value; // 显示数值
                            }
                        }
                    },
                    tooltip: {
                        headerFormat: '<b>{point.x}</b><br/>',
                        pointFormat: '{series.name}: {point.y}<br/>总计: {point.stackTotal}'
                    },
                    plotOptions: {
                        column: {
                            stacking: 'normal',
                            dataLabels: {
                                enabled: true,
                                format: '{point.y}'
                            }
                        }
                    },
                    series: response.data.map((item, index) => ({
                        name: item.name,
                        data: item.data,
                        color: Highcharts.getOptions().colors[index % Highcharts.getOptions().colors.length]
                    }))
                });
            },
            error: function () {
                alert("加载学历与公司类型数据时出错");
            }
        });


});
