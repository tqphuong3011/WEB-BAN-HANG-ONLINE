<%@ include file="/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- start content -->
<link >
<div class="container py-3">
    <div class="row">
        <div class="col-3">
            <div class="col title h4">Brand</div>
            <div class="col item">
                <div class="d-flex flex-column mb-3 b">
                    <a href="loadProductShop?action=loadAll" class="text-dark fw-semibold">All</a>
                    <c:forEach items="${listCategory}" var="c" varStatus="loop">
                        <a href="loadProductShop?action=loadByCategory&CID=${c.categoryID}&pageNumber=1" class="text-dark fw-semibold">${c.categoryName}</a>
                    </c:forEach>
                </div>
            </div>
            <div class="col title h4">Sizes</div>
            <div class="col item">
                <div class="d-flex flex-row mb-3 b">
                    <a class="text-decoration-none text-dark" href="loadProductShop?action=loadbysize&size=7&pageNumber=1">
                        <button type="button" class="btn btn-outline-dark rounded-0 me-2 fw-semibold p-0" style="width: 40px; height: 34px; font-size: 0.875rem">7</button>
                    </a>
                    <a class="text-decoration-none text-dark" href="loadProductShop?action=loadbysize&size=7.5&pageNumber=1">
                        <button type="button" class="btn btn-outline-dark rounded-0 me-2 fw-semibold p-0" style="width: 40px; height: 34px; font-size: 0.875rem">7.5</button>
                    </a>
                    <a class="text-decoration-none text-dark" href="loadProductShop?action=loadbysize&size=8&pageNumber=1">
                        <button type="button" class="btn btn-outline-dark rounded-0 me-2 fw-semibold p-0" style="width: 40px; height: 34px; font-size: 0.875rem">8</button>
                    </a>
                    <a class="text-decoration-none text-dark" href="loadProductShop?action=loadbysize&size=8.5&pageNumber=1">
                        <button type="button" class="btn btn-outline-dark rounded-0 me-2 fw-semibold p-0" style="width: 40px; height: 34px; font-size: 0.875rem">8.5</button>
                    </a>
                </div>
                <div class="d-flex flex-row mb-3 b">
                    <a class="text-decoration-none text-dark" href="loadProductShop?action=loadbysize&size=9&pageNumber=1">
                        <button type="button" class="btn btn-outline-dark rounded-0 me-2 fw-semibold p-0" style="width: 40px; height: 34px; font-size: 0.875rem">9</button>
                    </a>
                    <a class="text-decoration-none text-dark" href="loadProductShop?action=loadbysize&size=9.5&pageNumber=1">
                        <button type="button" class="btn btn-outline-dark rounded-0 me-2 fw-semibold p-0" style="width: 40px; height: 34px; font-size: 0.875rem">9.5</button>
                    </a>
                    <a class="text-decoration-none text-dark" href="loadProductShop?action=loadbysize&size=10&pageNumber=1">
                        <button type="button" class="btn btn-outline-dark rounded-0 me-2 fw-semibold p-0" style="width: 40px; height: 34px; font-size: 0.875rem">10</button>
                    </a>
                    <a class="text-decoration-none text-dark" href="loadProductShop?action=loadbysize&size=10.5&pageNumber=1">
                        <button type="button" class="btn btn-outline-dark rounded-0 me-2 fw-semibold p-0" style="width: 40px; height: 34px; font-size: 0.875rem">10.5</button>
                    </a>
                </div>
                <div class="d-flex flex-row mb-3 b">
                    <a class="text-decoration-none text-dark" href="loadProductShop?action=loadbysize&size=11&pageNumber=1">
                        <button type="button" class="btn btn-outline-dark rounded-0 me-2 fw-semibold p-0" style="width: 40px; height: 34px; font-size: 0.875rem">11</button>
                    </a>
                    <a class="text-decoration-none text-dark" href="loadProductShop?action=loadbysize&size=11.5&pageNumber=1">
                        <button type="button" class="btn btn-outline-dark rounded-0 me-2 fw-semibold p-0" style="width: 40px; height: 34px; font-size: 0.875rem">11.5</button>
                    </a>
                    <a class="text-decoration-none text-dark" href="loadProductShop?action=loadbysize&size=12&pageNumber=1">
                        <button type="button" class="btn btn-outline-dark rounded-0 me-2 fw-semibold p-0" style="width: 40px; height: 34px; font-size: 0.875rem">12</button>
                    </a>
                    <a class="text-decoration-none text-dark" href="loadProductShop?action=loadbysize&size=12.5&pageNumber=1">
                        <button type="button" class="btn btn-outline-dark rounded-0 me-2 fw-semibold p-0" style="width: 40px; height: 34px; font-size: 0.875rem">12.5</button>
                    </a>
                </div>
            </div>
            <div class="col title h4">Prices</div>

            <form action="loadbyprice" method="post">
                <div class="col item">
                    <div class="form-check">
                        <input class="form-check-input rounded-0 custom-control-input" type="checkbox" name="priceRange" value="under100" id="under100" onChange="checkChanged(this)">
                        <label class="form-check-label" for="under100">
                            Under 100$
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input rounded-0 custom-control-input" type="checkbox" name="priceRange" value="100to200" id="100to200" onChange="checkChanged(this)">
                        <label class="form-check-label" for="100to200">
                            100$ - 200$
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input rounded-0 custom-control-input" type="checkbox" name="priceRange" value="200to300" id="200to300" onChange="checkChanged(this)">
                        <label class="form-check-label" for="200to300">
                            200$ - 300$
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input rounded-0 custom-control-input" type="checkbox" name="priceRange" value="300to400" id="300to400" onChange="checkChanged(this)">
                        <label class="form-check-label" for="300to400">
                            300$ - 400$
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input rounded-0 custom-control-input" type="checkbox" name="priceRange" value="400plus" id="400plus" onChange="checkChanged(this)">
                        <label class="form-check-label" for="400plus">
                            400$ +
                        </label>
                    </div> 
                </div>
                <button type="button" class="btn btn-outline-dark rounded-0 me-2 fw-semibold p-0" style="width: 80px; height: 34px; font-size: 1rem">Submit</button>
            </form>
            <script>
                function checkChanged(checkbox) {
                    var checkboxes = document.querySelectorAll('input[type="checkbox"][name="priceRange"]');

                    checkboxes.forEach(function (cb) {
                        if (cb !== checkbox) {
                            cb.disabled = checkbox.checked;
                        }
                    });
                }
            </script>
        </div>
        <div class="col-9">
<!--            <div>${productCount}</div>
            <div>${endPage}</div>-->
            <div class="row"> 
                <!--<div>${productCount}</div>-->
                <!--<div>${indexPage}</div>-->
                <!--<div>${endPage}</div>-->
                <c:forEach items="${listShirt}" var="o" varStatus="loop">
                    <div class="col-md-3 p-2">
                        <a class="text-decoration-none text-dark" href="loadProductDetail?productID=${o.productID}">
                            <div class="border border-dark">
                                <div class="col px-2 py-1">
                                    <img src="${o.images[0].imageURL}" alt="alt" class="rounded mx-auto d-block img-fluid p-2 border" >
                                </div>
                                <!--<div class="col px-2 py-1"> ${o.productName}</div>-->
                                <div class="col px-2 py-1 h5">$${o.productPrice}</div>                         
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
            <div class="table-wrapper">
                <div class="clearfix">
                    <div class="hint-text">Showing <b>${indexPage*pageSize < productCount ? indexPage*pageSize : productCount}</b> out of <b>${productCount}</b> entries</div>
                    <ul class="pagination">
                        <c:if test="${action == 'loadAll' || action == 'loadByPage' }">
                            <c:forEach begin="1" end="${endPage}" var="i">
                                <li class="page-item ${indexPage==i?'active':''}">
                                    <a href="loadProductShop?action=loadByPage&pageNumber=${i}" class="page-link">${i}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${indexPage < endPage}">
                                <li class="page-item">
                                    <a href="loadProductShop?action=loadByPage&pageNumber=${indexPage+1}" class="page-link">Next</a>
                                </li>
                            </c:if>
                            <c:if test="${indexPage > 1}">
                                <li class="page-item">
                                    <a href="loadProductShop?action=loadByPage&pageNumber=${indexPage-1}" class="page-link">Previous</a>
                                </li>
                            </c:if>
                        </c:if>
                        <c:if test="${action == 'loadByCategory'}">
                            <c:forEach begin="1" end="${endPage}" var="i">
                                <li class="page-item ${indexPage==i?'active':''}">
                                    <a href="loadProductShop?action=loadByCategory&CID=${CID}&pageNumber=${i}" class="page-link">${i}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${indexPage < endPage}">
                                <li class="page-item">
                                    <a href="loadProductShop?action=loadByCategory&CID=${CID}&pageNumber=${indexPage+1}" class="page-link">Next</a>
                                </li>
                            </c:if>
                            <c:if test="${indexPage > 1}">
                                <li class="page-item">
                                    <a href="loadProductShop?action=loadByCategory&CID=${CID}&pageNumber=${indexPage-1}" class="page-link">Previous</a>
                                </li>
                            </c:if>
                        </c:if>
                        <c:if test="${action == 'loadbysize'}">
                            <c:forEach begin="1" end="${endPage}" var="i">
                                <li class="page-item ${indexPage==i?'active':''}">
                                    <a href="loadProductShop?action=loadbysize&size=${size}&pageNumber=${i}" class="page-link">${i}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${indexPage < endPage}">
                                <li class="page-item">
                                    <a href="loadProductShop?action=loadbysize&size=${size}&pageNumber=${indexPage+1}" class="page-link">Next</a>
                                </li>
                            </c:if>
                            <c:if test="${indexPage > 1}">
                                <li class="page-item">
                                    <a href="loadProductShop?action=loadbysize&size=${size}&pageNumber=${indexPage-1}" class="page-link">Previous</a>
                                </li>
                            </c:if>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end content -->

<%@ include file="/footer.jsp" %>