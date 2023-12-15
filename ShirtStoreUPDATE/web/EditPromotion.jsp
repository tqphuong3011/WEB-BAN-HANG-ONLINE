<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Stock&Stock</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Edit <b>Promotion</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="editPromotion" method="post">
                            <!--<input type="hidden" name="action" value="editUser"/>-->
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Promotion</h4>
                                <button type="submit" class="close" data-dismiss="modal" aria-hidden="true" name="action" value="closePromotion">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>Promotion Code</label>
                                    <input value="${promotion.promotionCode}" name="code" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Promotion Amount</label>
                                    <input value="${promotion.promotionAmount}" name="amount" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Start Date</label>
                                    <fmt:formatDate value="${promotion.startDate}" pattern="yyyy-MM-dd" var="formattedStartDate" />
                                    <input value="${formattedStartDate}" name="start" type="date" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>End Date</label>
                                    <fmt:formatDate value="${promotion.endDate}" pattern="yyyy-MM-dd" var="formattedEndDate" />
                                    <input value="${formattedEndDate}" name="end" type="date" class="form-control" required>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" name="action" value="editPromotion">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>


        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>