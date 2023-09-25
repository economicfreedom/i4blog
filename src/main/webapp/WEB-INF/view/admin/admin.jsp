<%--
  Created by IntelliJ IDEA.
  User: GGG
  Date: 2023-09-19
  Time: 오후 2:33
  To change this template use File | Settings | File Templates.
--%>
<style>
    #sidebar {
    overflow: hidden;
    z-index: 3;
}
#sidebar .list-group {
    min-width: 400px;
    background-color: #333;
    min-height: 100vh;
}
#sidebar i {
    margin-right: 6px;
}

#sidebar .list-group-item {
    border-radius: 0;
    background-color: #333;
    color: #ccc;
    border-left: 0;
    border-right: 0;
    border-color: #2c2c2c;
    white-space: nowrap;
}

/* highlight active menu */
#sidebar .list-group-item:not(.collapsed) {
    background-color: #222;
}

/* closed state */
#sidebar .list-group .list-group-item[aria-expanded="false"]::after {
  content: " \f0d7";
  font-family: FontAwesome;
  display: inline;
  text-align: right;
  padding-left: 5px;
}

/* open state */
#sidebar .list-group .list-group-item[aria-expanded="true"] {
  background-color: #222;
}
#sidebar .list-group .list-group-item[aria-expanded="true"]::after {
  content: " \f0da";
  font-family: FontAwesome;
  display: inline;
  text-align: right;
  padding-left: 5px;
}

/* level 1*/
#sidebar .list-group .collapse .list-group-item,
#sidebar .list-group .collapsing .list-group-item  {
  padding-left: 20px;
}

/* level 2*/
#sidebar .list-group .collapse > .collapse .list-group-item,
#sidebar .list-group .collapse > .collapsing .list-group-item {
  padding-left: 30px;
}

/* level 3*/
#sidebar .list-group .collapse > .collapse > .collapse .list-group-item {
  padding-left: 40px;
}

@media (max-width:768px) {
    #sidebar {
        min-width: 35px;
        max-width: 40px;
        overflow-y: auto;
        overflow-x: visible;
        transition: all 0.25s ease;
        transform: translateX(-45px);
        position: fixed;
    }

    #sidebar.show {
        transform: translateX(0);
    }

    #sidebar::-webkit-scrollbar{ width: 0px; }

    #sidebar, #sidebar .list-group {
        min-width: 1px;
        overflow: visible;
    }
    /* overlay sub levels on small screens */
    #sidebar .list-group .collapse.show, #sidebar .list-group .collapsing {
        position: relative;
        z-index: 1;
        width: 190px;
        top: 0;
    }
    #sidebar .list-group > .list-group-item {
        text-align: center;
        padding: .75rem .5rem;
    }
    /* hide caret icons of top level when collapsed */
    #sidebar .list-group > .list-group-item[aria-expanded="true"]::after,
    #sidebar .list-group > .list-group-item[aria-expanded="false"]::after {
        display:none;
    }
}

.collapse.show {
  visibility: visible;
}
.collapsing {
  visibility: visible;
  height: 0;
  -webkit-transition-property: height, visibility;
  transition-property: height, visibility;
  -webkit-transition-timing-function: ease-out;
  transition-timing-function: ease-out;
}
.collapsing.width {
  -webkit-transition-property: width, visibility;
  transition-property: width, visibility;
  width: 0;
  height: 100%;
  -webkit-transition-timing-function: ease-out;
  transition-timing-function: ease-out;
}

</style>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>


<div class="container-fluid">
    <div class="row d-flex d-md-block flex-nowrap wrapper">
        <div class="col-md-3 float-left col-1 pl-0 pr-0 collapse width show" id="sidebar">
            <div class="list-group border-0 text-center text-md-left">
                <a href="#menu1" class="list-group-item d-inline-block collapsed" data-toggle="collapse" aria-expanded="false"><i class="fa fa-dashboard"></i> <span class="d-none d-md-inline">Dashboard</span> </a>
                <div class="collapse" id="menu1" data-parent="#sidebar">
                    <a href="#menu1sub1" class="list-group-item" data-toggle="collapse" aria-expanded="false">Subitem 1 </a>
                    <div class="collapse" id="menu1sub1" data-parent="#menu1">
                        <a href="#" class="list-group-item" data-parent="#menu1sub1">Subitem a</a>
                        <a href="#" class="list-group-item" data-parent="#menu1sub1">Subitem b</a>
                        <a href="#menu1sub1sub1" class="list-group-item" data-toggle="collapse" aria-expanded="false">Subitem c </a>
                        <div class="collapse" id="menu1sub1sub1">
                            <a href="#" class="list-group-item" data-parent="#menu1sub1sub1">Subitem c.1</a>
                            <a href="#" class="list-group-item" data-parent="#menu1sub1sub1">Subitem c.2</a>
                        </div>
                        <a href="#" class="list-group-item" data-parent="#menu1sub1">Subitem d</a>
                        <a href="#menu1sub1sub2" class="list-group-item" data-toggle="collapse" aria-expanded="false">Subitem e </a>
                        <div class="collapse" id="menu1sub1sub2">
                            <a href="#" class="list-group-item">Subitem e.1</a>
                            <a href="#" class="list-group-item">Subitem e.2</a>
                        </div>
                    </div>
                    <a href="#menu1sub2" class="list-group-item" data-toggle="collapse" aria-expanded="false">Subitem 2</a>
                    <div class="collapse" id="menu1sub2" data-parent="#menu1">
                        <a href="#" class="list-group-item" data-parent="#menu1sub1">Subitem 1 a</a>
                        <a href="#" class="list-group-item" data-parent="#menu1sub1">Subitem 2 b</a>
                        <a href="#menu1sub1sub1" class="list-group-item" data-toggle="collapse" aria-expanded="false">Subitem 3 c </a>
                        <div class="collapse" id="menu1sub1sub1">
                            <a href="#" class="list-group-item" data-parent="#menu1sub1sub1">Subitem 3 c.1</a>
                            <a href="#" class="list-group-item" data-parent="#menu1sub1sub1">Subitem 3 c.2</a>
                        </div>
                        <a href="#" class="list-group-item" data-parent="#menu1sub1">Subitem 4 d</a>
                        <a href="#menu1sub1sub2" class="list-group-item" data-toggle="collapse" aria-expanded="false">Subitem 5 e </a>
                        <div class="collapse" id="menu1sub1sub2">
                            <a href="#" class="list-group-item" data-parent="#menu1sub1sub2">Subitem 5 e.1</a>
                            <a href="#" class="list-group-item" data-parent="#menu1sub1sub2">Subitem 5 e.2</a>
                        </div>
                    </div>
                    <a href="#" class="list-group-item">Subitem 3</a>
                </div>
                <a href="#" class="list-group-item d-inline-block collapsed"><i class="fa fa-film"></i> <span class="d-none d-md-inline">Item 2</span></a>
                <a href="#menu3" class="list-group-item d-inline-block collapsed" data-toggle="collapse" aria-expanded="false"><i class="fa fa-book"></i> <span class="d-none d-md-inline">Item 3 </span></a>
                <div class="collapse" id="menu3" data-parent="#sidebar">
                    <a href="#" class="list-group-item" data-parent="#menu3">3.1</a>
                    <a href="#menu3sub2" class="list-group-item" data-toggle="collapse" aria-expanded="false">3.2 </a>
                    <div class="collapse" id="menu3sub2">
                        <a href="#" class="list-group-item" data-parent="#menu3sub2">3.2 a</a>
                        <a href="#" class="list-group-item" data-parent="#menu3sub2">3.2 b</a>
                        <a href="#" class="list-group-item" data-parent="#menu3sub2">3.2 c</a>
                    </div>
                    <a href="#" class="list-group-item" data-parent="#menu3">3.3</a>
                </div>
                <a href="#" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i class="fa fa-heart"></i> <span class="d-none d-md-inline">Item 4</span></a>
                <a href="#" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i class="fa fa-list"></i> <span class="d-none d-md-inline">Item 5</span></a>
                <a href="#" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i class="fa fa-clock-o"></i> <span class="d-none d-md-inline">Link</span></a>
                <a href="#" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i class="fa fa-th"></i> <span class="d-none d-md-inline">Link</span></a>
                <a href="#" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i class="fa fa-gear"></i> <span class="d-none d-md-inline">Link</span></a>
                <a href="#" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i class="fa fa-calendar"></i> <span class="d-none d-md-inline">Link</span></a>
                <a href="#" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i class="fa fa-envelope"></i> <span class="d-none d-md-inline">Link</span></a>
                <a href="#" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i class="fa fa-bar-chart-o"></i> <span class="d-none d-md-inline">Link</span></a>
                <a href="#" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i class="fa fa-star"></i> <span class="d-none d-md-inline">Link</span></a>
            </div>
        </div>
        <main class="col-md-9 float-left col px-5 pl-md-2 pt-2 main">
            <a href="#" data-target="#sidebar" data-toggle="collapse"><i class="text-dark fa fa-navicon fa-lg py-2 p-1"></i></a>
            <div class="page-header">
                <h2 class="display-4 font-weight-light">Sidebar</h2>
            </div>
            <p class="lead">A responsive, multi-level vertical accordion menu.</p>
            <hr>
        </main>
    </div>
</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>