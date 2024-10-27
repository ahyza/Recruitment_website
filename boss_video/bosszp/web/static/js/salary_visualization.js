$(document).ready(function () {

    // 薪资与学历的关系
    $.ajax({
        type: "GET",
        url: "/geteducation_salary",
        success: function (msg) {
            var obj1 = JSON.parse(msg);
            if (obj1.status == 201) {
                alert("未加载到数据");
                return;
            }
            var data = obj1.data;
            Highcharts.chart('education_salary_chart', {
                chart: {
                    type: 'column',
                    backgroundColor: 'rgba(0,0,0,0)'
                },
                title: {
                    text: '不同学历的平均薪资'
                },
                credits: {
                    enabled: false
                },
                xAxis: {
                    categories: data.map(function (item) { return item.name; }),
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
                    name: '薪资',
                    data: data.map(function (item) { return item.value; })
                }]
    //             ,
    //              exporting: {
    //     buttons: {
    //         contextButton: {
    //             menuItems: ['downloadPNG', 'downloadJPEG', 'downloadPDF', 'downloadSVG', 'separator', 'viewFullscreen']
    //         }
    //     }
    // }
            });
        },
        error: function () {
            alert("Error fetching education salary data");
        }
    });
   $.ajax({
        type: "GET",
        url: "/get_salary_data",
        dataType: "json",
        success: function (response) {
            if (response.status === 201) {
                alert("未加载到数据");
                return;
            }

            var salaryData = response.data;
            var salaryLower = [];
            var salaryUpper = [];

            // 提取薪资下限和上限
            for (var i = 0; i < salaryData.length; i++) {
                salaryLower.push(parseFloat(salaryData[i].salary_lower.replace('k', '')) * 1000);
                salaryUpper.push(parseFloat(salaryData[i].salary_high.replace('k', '')) * 1000);
            }

            // 使用 Highcharts 绘制薪资分布图
            Highcharts.chart('salary_chart', {
                chart: {
                    type: 'column',
                    backgroundColor: 'rgba(0,0,0,0)'
                },
                title: {
                    text: '薪资分布统计'
                },
                credits: {
                    enabled: false
                },
                xAxis: {
                    categories: Array.from({ length: salaryLower.length }, (v, k) => k + 1),
                    title: {
                        text: '岗位序号'
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: '薪资 (元)'
                    }
                },
                series: [{
                    name: '薪资下限',
                    data: salaryLower
                }, {
                    name: '薪资上限',
                    data: salaryUpper
                }]
    //             ,
    //              exporting: {
    //     buttons: {
    //         contextButton: {
    //             menuItems: ['downloadPNG', 'downloadJPEG', 'downloadPDF', 'downloadSVG', 'separator', 'viewFullscreen']
    //         }
    //     }
    // }
            });
        },
        error: function (xhr, status, error) {
            console.error("Error fetching salary distribution data:", error);
            alert("获取薪资分布数据时发生错误，请稍后再试。");
        }
    });
    // 薪资增长趋势图
    // $.ajax({
    //     type: "GET",
    //     url: "/get_salary_trend",
    //     success: function (msg) {
    //         var obj1 = JSON.parse(msg);
    //         if (obj1.status == 201) {
    //             alert("未加载到数据");
    //             return;
    //         }
    //         var data = obj1.data;
    //         Highcharts.chart('salary_trend_chart', {
    //             chart: {
    //                 type: 'line',
    //                 backgroundColor: 'rgba(0,0,0,0)'
    //             },
    //             title: {
    //                 text: '薪资增长趋势'
    //             },
    //             credits: {
    //                 enabled: false
    //             },
    //             xAxis: {
    //                 categories: data.map(function (item) { return item.month; }),
    //                 title: {
    //                     text: '时间'
    //                 }
    //             },
    //             yAxis: {
    //                 title: {
    //                     text: '平均薪资 (元)'
    //                 }
    //             },
    //             series: [{
    //                 name: '薪资',
    //                 data: data.map(function (item) { return item.avg_salary; })
    //             }]
    //         });
    //     },
    //
    // });

    // 公司薪资排行榜
    $.ajax({
        type: "GET",
        url: "/get_company_salary_ranking",
        success: function (msg) {
            var obj1 = JSON.parse(msg);
            if (obj1.status == 201) {
                alert("未加载到数据");
                return;
            }
            var data = obj1.data;
            Highcharts.chart('company_salary_chart', {
                chart: {
                    type: 'bar',
                    backgroundColor: 'rgba(0,0,0,0)'
                },
                title: {
                    text: '公司薪资排行榜'
                },
                credits: {
                    enabled: false
                },
                xAxis: {
                    categories: data.map(function (item) { return item.name; }),
                    title: {
                        text: '公司名称'
                    }
                },
                yAxis: {
                    title: {
                        text: '平均薪资 (元)'
                    }
                },
                series: [{
                    name: '薪资',
                    data: data.map(function (item) { return item.value; })
                }]
    //             ,
    //
    //              exporting: {
    //     buttons: {
    //         contextButton: {
    //             menuItems: ['downloadPNG', 'downloadJPEG', 'downloadPDF', 'downloadSVG', 'separator', 'viewFullscreen']
    //         }
    //     }
    // }
            });
        },
        error: function () {
            alert("Error fetching company salary ranking data");
        }
    });

});