<?php
include 'includes/header.php';
            if (isset($_POST['login'])) {
    $uname=mysqli_real_escape_string($con,$_POST['user_name']); 
    $upass=mysqli_real_escape_string($con,$_POST['password']); 
    $query = "select * from users where username='$uname' and password=MD5('$upass') and active='1'"; 
    $run = mysqli_query($con,$query); 
    $user= mysqli_fetch_array($run); 
    if (mysqli_num_rows($run)>0){ 
        setcookie('user_name', $uname, time () + 60 * 60 * 24 * 30);
        setcookie('id', $user['id'], time () + 60 * 60 * 24 * 30);
        if (isset($_COOKIE['user_name'])){
            session_start();
        $_COOKIE['user_name']=$uname;
        $_SESSION['user_name']=$_COOKIE['user_name'];
        $_COOKIE['id'] = $user['id'];
         echo "<script>
    window.open('index.php', '_self')
</script>";
    }}else{
        include 'index.php';
        echo "<script>alert('Username or Password is not correct or you have not been activated yet')</script>";
        exit ();
            }
mysqli_close($con);            }
?>
    <div class="products-container">
        <div class="container_title">
            <h1>تسجيل الدخول إلى حسابك</h1>
        </div>
        <div class="clear-fix">
            <div class="products-body">
                <div class="blogin">
                    <h3>يجب تسجيل الدخول أولاً</h3>
                    <form action="login.php" method="post" class="login-form">
                        <input type="text" name="user_name" placeholder="إسم المستخدم" class="login-input" />
                        <input type="password" name="password" placeholder="كلمة المرور" class="login-input" />
                        <input type="submit" name="login" value="تسجيل الدخول" class="black-btn-login" />
                    </form>
                    <h3>إذا لم تكن تملك حساب قم الان بـ <a href="register.php">إنشاء حساب</a></h3>
                </div>
            </div>
        </div>
    </div>
    <?php include ("includes/footer.php") ; ?>
