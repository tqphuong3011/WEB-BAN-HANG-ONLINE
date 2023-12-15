<!DOCTYPE html>
<%@ include file="/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- start content -->
<div class="container p-3">
    <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted">Your cart</span>
                <span class="badge badge-secondary badge-pill">3</span>
            </h4>
            <ul class="list-group mb-3">
                <c:forEach var="lineitem" items="${user.getCart().productList}">
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">${lineitem.product.productName}</h6>
                            <small class="text-muted">Size:${lineitem.product.productSize}</small>
                            <small class="text-muted">Quantity=${lineitem.quantity}</small>
                            <small class="text-muted">Color:${lineitem.product.productColor}</small>

                        </div>
                        <span class="text-muted">$${lineitem.getPrice()}</span>
                    </li>
                </c:forEach>
                <c:if test="${promotion!=null}">
                    <li class="list-group-item d-flex justify-content-between bg-light">
                        <div class="text-success">
                            <h6 class="my-0">${promotion.promotionCode}</h6>
                            <small>Amount: ${promotion.promotionAmount}%</small>
                        </div>
                        <span class="text-success">-$<fmt:formatNumber value="${user.getCart().getTotal() * (promotion.promotionAmount/100)}" maxFractionDigits="1" /></span>
                    </li>
                </c:if>
                <li class="list-group-item d-flex justify-content-between">
                    <span>Total (USD)</span>
                    <strong>
                        $<fmt:formatNumber value="${user.getCart().getTotal() * ((100-promotion.promotionAmount) / 100)}" maxFractionDigits="1" />
                    </strong>
                </li>
            </ul>

            <form class="card p-2" action="loadtocheckout" method="post">
                Promotion
                <div class="input-group">
                    <input type="hidden" name="action" value="promotion">
                    <input type="text" class="form-control" name="promotionCode">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary">Check</button>
                    </div>
                </div>
                ${message}
            </form>
        </div>
        <div class="col-md-8 order-md-1">
            <h4 class="mb-3">Billing address</h4>
            <form class="needs-validation" novalidate action="loaddetailinvoice" method="post">
                <input type="hidden" name="action" value="buy">
                <c:if test="${promotion!=null}">
                    <input type="hidden" name="total" value="${user.getCart().getTotal() * ((100-promotion.promotionAmount) / 100)}" />
                    <input type="hidden" name="subTotal" value="${user.getCart().getTotal()}" />
                    <input type="hidden" name="discount" value="${promotion.promotionAmount}" />
                </c:if>    
                <c:if test="${promotion==null}">
                    <input type="hidden" name="total" value="${user.getCart().getTotal()}" />
                    <input type="hidden" name="subTotal" value="${user.getCart().getTotal()}" />
                    <input type="hidden" name="discount" value="0" />
                </c:if>    
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="firstName">First name</label>
                        <input type="text" class="form-control" name="firstName" id="firstName" value="${user.firstName}" required>
                        <div class="invalid-feedback">
                            Valid first name is required.
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Last name</label>
                        <input type="text" class="form-control" name="lastName" id="firstName" value="${user.lastName}" required>
                        <div class="invalid-feedback">
                            Valid last name is required.
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="email">Email <span class="text-muted">(Optional)</span></label>
                    <input type="email" class="form-control" name="email" id="email" value="${user.email}">
                    <div class="invalid-feedback">
                        Please enter a valid email address for shipping updates.
                    </div>
                </div>

                <div class="mb-3">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" name="address" id="address" placeholder="1234 Main St" required>
                    <div class="invalid-feedback">
                        Please enter your shipping address.
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-5 mb-3">
                        <label for="city">City</label>
                        <select class="custom-select d-block w-100 rounded-0" name="city" id="city" style="height:37.6px" required>
                            <option value="">Choose...</option>
                            <option>HCM city</option>
                            <option>Da Nang</option>
                            <option>Ha Noi</option>
                        </select>
                        <div class="invalid-feedback">
                            Please select a valid country.
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="district">District</label>
                        <select class="custom-select d-block w-100 rounded-0" name="district" id="district" style="height:37.6px" required>
                            <option value="">Choose...</option>
                            <option>Di An</option>
                            <option>Binh Thanh</option>
                        </select>
                        <div class="invalid-feedback">
                            Please provide a valid state.
                        </div>
                    </div>
                </div>
                <hr class="mb-4">

                <h4 class="mb-3">Payment</h4>

                <div class="d-block my-3">
                    <div class="custom-control custom-radio">
                        <input id="CashOnHand" name="paymentMethod" type="radio" class="custom-control-input" value="Cash on hand" checked required>
                        <label class="custom-control-label" for="CashOnHand">Cash on hand</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input id="SmartBanking" name="paymentMethod" type="radio" class="custom-control-input" value="Smart banking" required>
                        <label class="custom-control-label" for="SmartBanking">Smart banking</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input id="MoMo" name="paymentMethod" type="radio" class="custom-control-input" value="MoMo" required>
                        <label class="custom-control-label" for="MoMo">MoMo</label>
                    </div>
                </div>


                <hr class="mb-4">
                <button class="btn btn-success btn-lg btn-block" type="submit">Finish and Buy</button>
            </form>
        </div>
    </div>
</div>
<!-- end content -->

<%@ include file="/footer.jsp" %>