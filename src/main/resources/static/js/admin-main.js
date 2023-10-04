$(document).ready(function () {
        $.ajax({
            url: "/admin/chart-data",
            type: "get",
            dataType: 'json',
            success: function (res) {
                data = res;
                console.log(res);
                console.log(data.userCounts);
                make_user_chart(res);
                make_board_chart(res);
                make_comment_chart(res);
                make_report_chart(res);
            },
            error: function () {
                alert("실패함");
            }


        }); // end of $.ajax


        function make_user_chart(res) {


            const ctx = document.getElementById('user-chart');

            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: res.userCreatedDates,
                    datasets: [{
                        label: '최근 7일간 회원가입',
                        data: res.userCounts,
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true,
                            max: Number(Math.max(...data.userCounts) + 100)


                        }
                    }
                }
            })
        } // end of make_user_chart

        function make_board_chart(res) {


            const ctx = document.getElementById('board-chart');

            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: res.boardCreatedDates,
                    datasets: [{
                        label: '최근 7일간 게시글 작성',
                        data: res.boardCounts,

                        backgroundColor: 'rgba(57, 255, 100, 0.6)',
                        borderColor: 'rgba(0, 100, 0, 1)',
                        borderWidth: 1

                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true,
                            max: Number(Math.max(...data.boardCounts) + 100)


                        }
                    }
                }
            })
        } // end of make_board_chart

        function make_comment_chart(res) {


            const ctx = document.getElementById('comment-chart');

            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: res.commentCreatedDates,
                    datasets: [{
                        label: '최근 7일간 댓글작성',
                        data: res.commentCounts,
                        borderWidth: 1,
                        backgroundColor: 'rgba(57, 255, 20, 0.6)',
                        borderColor: 'rgba(0, 128, 0, 1)',

                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true,
                            max: Number(Math.max(...data.commentCounts) + 100)


                        }
                    }
                }
            })
        } // end of make_comment_chart

        function make_report_chart(res) {


            const ctx = document.getElementById('report-chart');

            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: res.reportCreatedDates,
                    datasets: [{
                        label: '최근 7일간 신고접수',
                        data: res.reportCounts,
                        borderWidth: 1,
                        backgroundColor: 'rgba(255, 0, 0, 0.2)',  // 붉은색 배경 with 20% opacity
                        borderColor: 'rgba(50, 50, 50, 1)',
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true,
                            max: Number(Math.max(...data.reportCounts) + 100)


                        }
                    }
                }
            })
        }// end of make_report_chart
    });