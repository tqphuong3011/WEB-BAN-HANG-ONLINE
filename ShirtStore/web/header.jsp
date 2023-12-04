<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Stock&Stock</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <!--<link rel="stylesheet" href="styles/main.css" type="text/css">-->
        <link rel="stylesheet" href="styles/shop.css" type="text/css">
    </head>

    <body>
         
        <nav class="navbar navbar-expand-xl border-bottom border-dark"> 
            <div class="container-fluid">
                <a class="navbar-brand fs-3 fw-bold mx-3" href="/ShirtStore" style="color: #ff9f1a">SOCKSHIRT</a>
                <div style="width:46%">
                    <div class="d-flex form-inputs border border-dark" style="width: 100%;">
                        <input class="form-control rounded-0" type="text" placeholder="Search any product..." style="background-color: #fafafa">
                        <i class="bx bx-search"></i>
                    </div>
                </div>
                <button class="navbar-toggler"
                        data-bs-toggle="collapse"
                        data-bs-target="#navbar"> 
                    <span class="navbar-toggler-icon"> 
                    </span> 
                </button>
                <div class="collapse navbar-collapse ps-3" 
                     id="navbar"> 
                    <ul class="navbar-nav"> 
                        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
                        <c:if test="${not empty sessionScope.user and sessionScope.user.isAdmin eq 1}">
                            <!-- If the user is an admin, show Admin dropdown -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-dark fs-5 fw-semibold mx-1" href="#" id="adminDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Admin
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="adminDropdown">
                                    <li><a class="dropdown-item" href="loadUserAdmin?action=loadUser">Account</a></li>
                                    <li><a class="dropdown-item" href="loadProductAdmin?action=loadProduct">Product</a></li>
                                    <li><a class="dropdown-item" href="loadInvoiceAdmin?action=loadInvoice">Invoice</a></li>
                                    <li><a class="dropdown-item" href="loadPromotionAdmin?action=loadPromotion">Promotion</a></li>
                                    <li><a class="dropdown-item" href="loadCategoryAdmin?action=loadCategory">Category</a></li>
                                </ul>
                            </li>
                        </c:if>
                        <li class="nav-item"> 
                            <a class="nav-link text-dark fs-5 fw-semibold mx-1" href="/ShirtStore"> 
                                Home
                            </a> 
                        </li> 
                        <li class="nav-item"> 
                            <a class="nav-link text-dark fs-5 fw-semibold mx-1" href="loadProductShop?action=loadAll"> 
                                Brand
                            </a> 
                        </li>
                        <li class="nav-item"> 
                            <a class="nav-link text-dark fs-5 fw-semibold mx-1" href="#"> 
                                Cart
                            </a> 
                        </li>
                        <li class="nav-item"> 
                            <a class="nav-link text-dark fs-5 fw-semibold mx-1" href="#"> 
                                About
                            </a> 
                        </li>
                        <li class="nav-item"> 
                            <a class="nav-link text-dark fs-5 fw-semibold mx-1" href="#"> 
                                Help
                            </a> 
                        </li>

                        <li class="nav-item">
                            <c:if test="${empty sessionScope.user}">
                                <!-- If the user is not logged in, show the login and signup buttons -->
                                <div class="d-flex flex-row align-items-center nav-link">
                                    <form action="login" method="post">
                                        <input type="hidden" name="action" value="login">
                                        <button type="submit" name="action" value="login" class="btn btn-outline-dark rounded-0 fw-semibold me-2 text-nowrap">Login</button>
                                    </form>

                                    <form action="register" method="post">
                                        <input type="hidden" name="action" value="signup">
                                        <button type="submit" name="action" value="signup" class="btn btn-outline-dark rounded-0 fw-semibold me-2 text-nowrap">Sign Up</button>
                                    </form>
                                </div>
                            </c:if>
                        </li>
                    </ul>

                    <c:if test="${not empty sessionScope.user}">
                        <div class="dropdown">
                            <button class="btn btn-outline-dark rounded-0 fw-semibold me-2 text-nowrap dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <!--Dropdown button-->
                                <c:set var="loggedInUser" value="${sessionScope.user}" />
                                <c:out value="${loggedInUser.firstName}" />
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="editUsr?action=goToEdit">Edit Profile</a>
                                <a class="dropdown-item" href="logout?action=logout">Log out</a>
                            </div>
                        </div>
                    </c:if>

                </div> 
            </div> 
        </nav>