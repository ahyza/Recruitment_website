$(document).ready(function () {
    // 公司规模分布
    $.ajax({
        url: '/get_company_size_distribution',
        type: 'GET',
        success: function (data) {
            Highcharts.chart('company_size_distribution', {
                chart: {
                    type: 'pie',
                    backgroundColor: 'rgba(0,0,0,0)'
                },
                title: {
                    text: '公司规模分布'
                },
                credits: {
                    enabled: false
                },
                series: [{
                    name: '公司数量',
                    data: data.data
                }]
    //             ,
    //                 exporting: {
    //     buttons: {
    //         contextButton: {
    //             menuItems: ['downloadPNG', 'downloadJPEG', 'downloadPDF', 'downloadSVG', 'separator', 'viewFullscreen']
    //         }
    //     }
    // }
            });
        },
        error: function () {
            alert('Error fetching company size data');
        }
    });

    // 公司规模与平均薪资
    $.ajax({
        url: '/get_salary_vs_company_size',
        type: 'GET',
        success: function (data) {
            Highcharts.chart('salary_vs_company_size', {
                chart: {
                    type: 'column',
                    backgroundColor: 'rgba(0,0,0,0)'
                },
                title: {
                    text: '公司规模与平均薪资'
                },
                credits: {
                    enabled: false
                },
                xAxis: {
                    categories: data.categories
                },
                yAxis: {
                    title: {
                        text: '平均薪资 (K)'
                    }
                },
                series: [{
                    name: '平均薪资',
                    data: data.data
                }]

            });
        },
        error: function () {
            alert('Error fetching salary vs company size data');
        }
    });

    // 公司类型分布
    $.ajax({
        url: '/get_company_type_distribution',
        type: 'GET',
        success: function (data) {
            Highcharts.chart('company_type_distribution', {
                chart: {
                    type: 'pie',
                    backgroundColor: 'rgba(0,0,0,0)'
                },
                title: {
                    text: '公司类型分布'
                },
                credits: {
                    enabled: false
                },
                series: [{
                    name: '公司类型',
                    data: data.data
                }]

            });
        },
        error: function () {
            alert('Error fetching company type distribution data');
        }
    });

    // 就业环境分析（替换为漏斗图）
    $.ajax({
        url: '/get_job_market_analysis',
        type: 'GET',
        success: function (data) {
            Highcharts.chart('job_market_analysis', {
                chart: {
                    type: 'funnel',
                    backgroundColor: 'rgba(0,0,0,0)'
                },
                title: {
                    text: '就业环境分析'
                },
                credits: {
                    enabled: false
                },
                series: [{
                    name: '岗位数量',
                    data: data.data.map((value, index) => ({
                        name: data.categories[index],
                        y: value
                    }))
                }]
    //             ,
    //                 exporting: {
    //     buttons: {
    //         contextButton: {
    //             menuItems: ['downloadPNG', 'downloadJPEG', 'downloadPDF', 'downloadSVG', 'separator', 'viewFullscreen']
    //         }
    //     }
    // }
            });
        },
        error: function () {
            alert('Error fetching job market analysis data');
        }
    });
});
