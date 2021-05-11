<?php include ("includes/header.php");
$sql=mysqli_query($con,"select * from cart");
//$run_sql=mysqli_fetch_array($sql);
?>
<?php
if (isset($_POST['remove'])){
    $id=$_POST['id'];
    $remove="delete from cart where id=$id";
}
?>
    <div class="products-container">
        <div class="container_title">
            <h1>معلومات السلة</h1>
        </div>
        <div class="clear-fix">
            <div class="products-body">
                <table class="table table-striped">
                    <tr>
                        <th>المنتج</th>
                        <th>الكمية</th>
                        <th>السعر</th>
                        <th></th>
                    </tr>
                    <?php while ($row=mysqli_fetch_array($sql)): ?>
                    <tr>
                        <td>
                            <?php echo $row ['p_name'];?>
                        </td>
                        <td>
                            <?php echo $row ['qty'];?>
                        </td>
                        <td>
                            <?php echo $row ['price'];?>
                        </td>
                        <td>
                            <form method="post" action="cart.php">
                                <input type="hidden" name="id" class="black-btn-pro" value="<?php echo $row['id'] ; ?>">
                                <input type="submit" name="remove" class="black-btn-pro" value="إزالة">
                            </form>
                        </td>
                    </tr>
                    <?php endwhile; ?>
                    <tr>
                        <td>رسوم نقل</td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>الإجمالي</td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" name="remove" class="black-btn-pro" value="تأكيد عملية الشراء"></td>
                        <td></td>
                        <td></td>

                    </tr>

                </table>
            </div>
        </div>
    </div>
    <?php include'includes/footer.php'; ?>
