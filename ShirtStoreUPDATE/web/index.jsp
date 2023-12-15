<%@ include file="header.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!--start carousel-->
<div class="container">
    <div class="row py-3">
        <div class="col-12">
            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images/1.png" class="d-block w-100 img-fluid" alt="..." style="height: 600px">
                    </div>
                    <div class="carousel-item"> 
                        <img src="images/2.png" class="d-block w-100 img-fluid" alt="..." style="height: 600px">
                    </div>
                    <div class="carousel-item">
                        <img src="images/3.png" class="d-block w-100 img-fluid" alt="..." style="height: 600px">
                    </div> 
                    <div class="carousel-item">
                        <img src="images/4.png" class="d-block w-100 img-fluid" alt="..." style="height: 600px">
                    </div> 
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </div> 
</div>
<!--end carousel-->

<!-- start content -->
<div class="container">
    <div class="row">
        <div class="col p-2 h2">Recommended For You</div>
    </div>
    <div id="recommend" class="row h-25">
        <c:forEach items="${sessionScope.recommendList}" var="o">
            <div class="recommendAmount col-md-2 p-2 h-100">
                <a href="loadProductDetail?productID=${o.productID}" class="text-decoration-none text-dark">
                    <div class="border border-dark">
                        <div class="col px-2 py-1">
                            <img src="${o.images[0].imageURL}" alt="alt" class="rounded mx-auto d-block img-fluid p-2">
                        </div>
                        <div class="col px-2 py-1">${o.productName}</div>
                        <div class="col px-2 py-1 h5">$${o.productPrice}</div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>

</div>
<!-- end content -->



<!-- start content -->
<div class="container">
    <div class="row">
        <div class="col p-2 h2">NEW TSHIRT</div>
        <div class="col-auto p-2 h2 text-right small">
            <a href="loadProductShop?action=loadByCategory&CID=51&pageNumber=1" class="text-decoration-none text-success">See All <i class="fas fa-arrow-right"></i></a>
        </div>
    </div>
    <div id="TSHIRT" class="row">
        <c:forEach items="${sessionScope.airjordanList}" var="o">
            <div class="tshirtAmount col-md-2 p-2">
                <a href="loadProductDetail?productID=${o.productID}" class="text-decoration-none text-dark">
                    <div class="border border-dark">
                        <div class="col px-2 py-1">
                            <img src="${o.images[0].imageURL}" alt="alt" class="rounded mx-auto d-block img-fluid p-2">
                        </div>
                        <div class="col px-2 py-1">${o.productName}</div>
                        <div class="col px-2 py-1 h5">$${o.productPrice}</div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>

</div>
<!-- end content -->

<!-- start content -->
<div class="container">
    <div class="row">
        <div class="col p-2 h2">NEW SHIRT</div>
        <div class="col-auto p-2 h2 text-right small">
            <a href="loadProductShop?action=loadByCategory&CID=52&pageNumber=1" class="text-decoration-none text-success">See All <i class="fas fa-arrow-right"></i></a>
        </div>
    </div>
    <div id="SHIRT" class="row">
        <c:forEach items="${sessionScope.adidasList}" var="o">
            <div class="shirtAmount col-md-2 p-2">
                <a href="loadProductDetail?productID=${o.productID}" class="text-decoration-none text-dark">
                    <div class="border border-dark">
                        <div class="col px-2 py-1">
                            <img src="${o.images[0].imageURL}" alt="alt" class="rounded mx-auto d-block img-fluid p-2">
                        </div>
                        <div class="col px-2 py-1">${o.productName}</div>
                        <div class="col px-2 py-1 h5">$${o.productPrice}</div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
 
</div>
<!-- end content -->

<!-- start content -->
<div class="container">
    <div class="row">
        <div class="col p-2 h2">NEW SWEATER</div>
        <div class="col-auto p-2 h2 text-right small">
            <a href="loadProductShop?action=loadByCategory&CID=53&pageNumber=1#" class="text-decoration-none text-success">See All <i class="fas fa-arrow-right"></i></a>
        </div>
    </div>
    <div id="SWEATER" class="row">
        <c:forEach items="${sessionScope.ascisList}" var="o">
            <div class="sweaterAmount col-md-2 p-2">
                <a href="loadProductDetail?productID=${o.productID}" class="text-decoration-none text-dark">
                    <div class="border border-dark">
                        <div class="col px-2 py-1">
                            <img src="${o.images[0].imageURL}" alt="alt" class="rounded mx-auto d-block img-fluid p-2">
                        </div>
                        <div class="col px-2 py-1">${o.productName}</div>
                        <div class="col px-2 py-1 h5">$${o.productPrice}</div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>

</div>
<!-- end content -->

<!-- start content -->
<div class="container">
    <div class="row">
        <div class="col p-2 h2">NEW POLO</div>
        <div class="col-auto p-2 h2 text-right small">
            <a href="loadProductShop?action=loadByCategory&CID=54&pageNumber=1" class="text-decoration-none text-success">See All <i class="fas fa-arrow-right"></i></a>
        </div>
    </div>
    <div id="POLO" class="row">
        <c:forEach items="${sessionScope.converseList}" var="o">
            <div class="poloAmount col-md-2 p-2">
                <a href="loadProductDetail?productID=${o.productID}" class="text-decoration-none text-dark">
                    <div class="border border-dark">
                        <div class="col px-2 py-1">
                            <img src="${o.images[0].imageURL}" alt="alt" class="rounded mx-auto d-block img-fluid p-2">
                        </div>
                        <div class="col px-2 py-1">${o.productName}</div>
                        <div class="col px-2 py-1 h5">$${o.productPrice}</div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
    
</div>
<!-- end content -->

<!-- start content -->
<div class="container">
    <div class="row">
        <div class="col p-2 h2">NEW HOODIE</div>
        <div class="col-auto p-2 h2 text-right small">
            <a href="loadProductShop?action=loadByCategory&CID=55&pageNumber=1" class="text-decoration-none text-success">See All <i class="fas fa-arrow-right"></i></a>
        </div>
    </div>
    <div id="HOODIE" class="row">
        <c:forEach items="${sessionScope.newbalanceList}" var="o">
            <div class="hoodieAmount col-md-2 p-2">
                <a href="loadProductDetail?productID=${o.productID}" class="text-decoration-none text-dark">
                    <div class="border border-dark">
                        <div class="col px-2 py-1">
                            <img src="${o.images[0].imageURL}" alt="alt" class="rounded mx-auto d-block img-fluid p-2">
                        </div>
                        <div class="col px-2 py-1">${o.productName}</div>
                        <div class="col px-2 py-1 h5">$${o.productPrice}</div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
    
</div>
<!-- end content -->


<%@ include file="/footer.jsp" %>