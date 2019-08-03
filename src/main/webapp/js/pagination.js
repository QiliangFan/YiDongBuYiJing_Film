export function pagination(currentPage,pageSize,selectType,orderBy,sortType){
    $.ajax({
        url: "/Movies/searchMovie",
        data: {
            currentPage: currentPage,
            pageSize: pageSize,
            selectType: selectType,
            orderBy: orderBy,
            sortType: sortType
        },
        type: "post",
        success: function (data) {
            //服务器端相应的json数据
            if (data.code == 0) {
                sessionStorage.setItem('list',data.page.list);
                sessionStorage.setItem('currentPage',data.page.currentPage);
                sessionStorage.setItem('totalPage',data.page.totalPage);
            } else {
                //查询失败
                alert("查询失败");
            }
        }
    });
}

