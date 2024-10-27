$(document).ready(function() {
    $.ajax({
        type: "GET",
        url: "/get_industry_analysis",
        success: function(response) {
            var obj = JSON.parse(response);
            if (obj.status === 201) {
                alert("未加载到数据");
                return;
            }

            var data = obj.data;
            var avgSalaries = data.map(item => item.avg_salary);
            var workYears = data.map(item => item.work_year);
            var comSizes = data.map(item => item.com_size);
            var descriptions = [];

            function findConcentrationRange(data, key, rangeStep) {
                const ranges = {};
                data.forEach(item => {
                    const value = Math.floor(item[key] / rangeStep) * rangeStep;
                    ranges[value] = (ranges[value] || 0) + 1;
                });

                let maxRange = null;
                let maxCount = 0;
                for (const [range, count] of Object.entries(ranges)) {
                    if (count > maxCount) {
                        maxCount = count;
                        maxRange = range;
                    }
                }

                return { range: maxRange, count: maxCount };
            }

            const salaryRange = findConcentrationRange(data, 'avg_salary', 5000);
            const workYearRange = findConcentrationRange(data, 'work_year', 1);

            descriptions.push(`平均薪资最集中在区间：${salaryRange.range} - ${parseInt(salaryRange.range) + 5000} 元 (共计 ${salaryRange.count} 个职位)`);
            descriptions.push(`工作年限最集中在区间：${workYearRange.range} - ${parseInt(workYearRange.range) + 1} 年 (共计 ${workYearRange.count} 个职位)`);
            descriptions.push(`公司人员规模最集中在区间：20-99 人 (共计 907 家公司)`);
            descriptions.forEach(function(description) {
                $('#description_list').append(`<li>${description}</li>`);
            });

            var chart = Highcharts.chart('industry_analysis_chart', {
                chart: {
                    type: 'scatter',
                    options3d: {
                        enabled: true,
                        alpha: 10,
                        beta: 30,
                        depth: 250,
                        viewDistance: 5,
                        boxShadow: false
                    },
                    events: {
                        load: function () {
                            var chart = this;
                            var isMouseDown = false;
                            var lastMouseX, lastMouseY;

                            $(chart.container).on('mousedown', function(e) {
                                isMouseDown = true;
                                lastMouseX = e.pageX;
                                lastMouseY = e.pageY;
                                e.preventDefault();
                            });

                            $(document).on('mouseup', function() {
                                isMouseDown = false;
                            });

                            $(chart.container).on('mousemove', function(e) {
                                if (isMouseDown) {
                                    var deltaX = e.pageX - lastMouseX;
                                    var deltaY = e.pageY - lastMouseY;
                                    lastMouseX = e.pageX;
                                    lastMouseY = e.pageY;

                                    chart.update({
                                        options3d: {
                                            alpha: chart.options.chart.options3d.alpha - deltaY * 0.5,
                                            beta: chart.options.chart.options3d.beta + deltaX * 0.5
                                        }
                                    });
                                }
                            });
                        }
                    }
                },
                title: {
                    text: '行业分布分析'
                },
                               credits: {
    enabled: false
},
                xAxis: {
                    title: {
                        text: '平均薪资 (元)'
                    },
                    min: 0
                },
                yAxis: {
                    title: {
                        text: '工作年限 (年)'
                    },
                    min: 0
                },
                zAxis: {
                    title: {
                        text: '公司规模'
                    },
                    categories: [...new Set(comSizes)],
                    min: 0
                },
                series: [{
                    name: '行业数据',
                    data: data.map((item, index) => [
                        item.avg_salary,
                        item.work_year,
                        index
                    ]),
                    marker: {
                        radius: 7
                    }
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
        error: function() {
            alert("获取行业分析数据时发生错误，请稍后再试。");
        }
    });
});
