<%@ include file="/header.jsp" %>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">

<link href="css/detailProduct.css" rel="stylesheet" type="text/css"/>
<!-- start content -->

<div class="container">
    <div class="card">
        <div class="container-fliud">
            <div class="wrapper row">
                <div class="preview col-md-6">
                        <div class="preview-pic tab-content">
                          <div class="tab-pane active" id="pic-1"><img src="${detailShirt.images[0].imageURL}" alt=""/></div>
                          <div class="tab-pane" id="pic-2"><img src="${detailShirt.images[1].imageURL}" alt=""/></div>
                          <div class="tab-pane" id="pic-3"><img src="${detailShirt.images[2].imageURL}" alt=""/></div>
                        </div>
                </div>
                <div class="details col-md-6">
                    <h3 class="product-title">${detailShirt.productName}</h3>
                    <p class="product-description">${detailShirt.productDecription}</p>
                    <h4 class="price">current price: <span>$${detailShirt.productPrice}</span></h4>
                    <h5 class="sizes">category: ${detailShirt.category.categoryName}</h5>
                    <h5 class="sizes">sizes: ${detailShirt.productSize}</h5>                                
                    <h5 class="sizes">colors: ${detailShirt.productColor}</h5>
                    
                    <div class="action">
                            <a href="loadtocart?action=AddCart&productID=${detailShirt.productID}" style="color: black;"><button class="add-to-cart btn btn-default" type="button">add to cart</button></a>
                            <button class="add-to-cart btn btn-default" type="button">buy now</button>
                            <button class="like btn btn-default" type="button"><span class="fa fa-heart"></span></button>
                    </div>
                    <ul class="preview-thumbnail nav nav-tabs">
                      <li class="active"><a data-target="#pic-1" data-toggle="tab"><img src="${detailShirt.images[0].imageURL}" alt=""/></a></li>
                      <li><a data-target="#pic-2" data-toggle="tab"><img src="${detailShirt.images[1].imageURL}" alt=""/></a></li>
                      <li><a data-target="#pic-3" data-toggle="tab"><img src="${detailShirt.images[2].imageURL}" alt=""/></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col p-2 h2">Recommended For You</div>
    </div>
    <div class="row">
        <c:forEach items="${listShirt}" var="o">
            <div class="col-md-3 p-2">
                <div class="border border-dark">
                    <div class="col px-2 py-1">
                        <a href="loadProductDetail?productID=${o.productID}">
                            <img src="${o.images[0].imageURL}" alt="alt" class="rounded mx-auto d-block img-fluid p-2 border">
                        </a>
                    </div>
                    <div class="col px-2 py-1 h5">$${o.productPrice}</div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<!-- end content -->

<%@ include file="/footer.jsp" %>