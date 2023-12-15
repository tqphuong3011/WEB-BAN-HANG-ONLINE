
<%@ include file="/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!-- start content -->
<div class="container p-3 my-5 clearfix ">
    <!-- Shopping cart table -->
    <div class="card">
        <div class="card-header">
            <h2>Shopping Cart</h2>
            
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered m-0">
                    <thead>
                        <tr>
                            <!-- Set columns width -->
                            <th class="text-right py-3 px-4" style="width: 100px;">Image</th>
                            <th class="text-center py-3 px-4" style="min-width: 400px;">Product Name &amp; Details</th>
                            <th class="text-right py-3 px-4" style="width: 100px;">Price</th>
                            <th class="text-center py-3 px-4" style="width: 120px;">Quantity</th>
                            <th class="text-right py-3 px-4" style="width: 100px;">Total</th>
                            <th class="text-center align-middle py-3 px-0" style="width: 40px;"><a href="#" class="shop-tooltip float-none text-light" title="" data-original-title="Clear cart"><i class="ino ion-md-trash"></i></a></th>
                        </tr>
                    </thead>
                    <tbody>
                            <c:forEach var="lineitem" items="${user.getCart().productList}">
                            <tr>
                                <td><img src="${lineitem.product.images[0].imageURL}" class="d-block ui-w-40 ui-bordered mr-4" alt=""></td>
                                <td class="p-4">
                                    <div class="media align-items-center">
                                        <div class="media-body">
                                            <a href="#" class="d-block text-dark">${lineitem.product.productName}</a>
                                            <small>
<!--                                                <span class="text-muted">Color:</span>${lineitem.product.productColor}&nbsp;-->
<!--                                                <span class="ui-product-color ui-product-color-sm align-text-bottom" style="background:#000;"></span> &nbsp;-->
                                                <span class="text-muted">Size: </span> ${lineitem.product.productSize} &nbsp;
                                                <span class="text-muted">Color: </span> ${lineitem.product.productColor} &nbsp;
                                                <span class="text-muted">Category: </span> ${lineitem.product.category.getCategoryName()}
                                            </small>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-right font-weight-semibold align-middle p-4">$${lineitem.product.productPrice}</td>
                                <td class="align-middle p-4">
                                    <form action="loadtocart" method="post">
                                        <input type="hidden" name="action" value="UpdateCart">
                                        <input type="hidden" name="productID" value="${lineitem.product.productID}">
                                    <input type="text" class="form-control text-center" name="quantity" value="${lineitem.quantity}">
                                    
                                        <button type="submit" class="btn btn-lg  btn-secondary mt-2">Update</button>

                                    </form>
                                </td>
                                <td class="text-right font-weight-semibold align-middle p-4">$${lineitem.getPrice()}</td>
                                <td class="text-center align-middle px-0"><a href="loadtocart?action=RemoveCart&productID=${lineitem.product.productID}" class="shop-tooltip close float-none text-danger" title="" data-original-title="Remove">[X]</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- / Shopping cart table -->

            <div class="d-flex flex-wrap justify-content-between align-items-center pb-4">
                <div class="mt-4">
                    
                </div>
                <div class="d-flex">
                    <div class="text-right mt-4">
                        <label class="text-muted font-weight-normal m-0">Total price</label>
                        <div class="text-large"><strong>$${user.getCart().getTotal()}</strong></div>
                    </div>
                </div>
            </div>

            <div class="float-right">
                <button type="button" class="btn btn-lg btn-dark md-btn-flat mt-2 mr-3"><a href="loadProductShop?action=loadAll" style="color: white; text-decoration: none;">Back to shopping</a></button>
                <button type="button" class="btn btn-lg btn-success mt-2"><a href="loadtocheckout?action=nopromotion" style="color: white; text-decoration: none;">Checkout</a></button>
            </div>

        </div>
    </div>
</div>
<!-- end content -->

<%@ include file="/footer.jsp" %>