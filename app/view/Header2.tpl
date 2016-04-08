<div id="userInfo">
    Welcome <a href="<?= BASE_URL ?>/GoToUser/<?= $_SESSION['username'] ?>"><?= $_SESSION['username'] ?></a>,  <a href="<?= BASE_URL ?>/logout"> Log Out</a><br>
    <form id="searchUser" method="POST" action="">
        <input type="text" name="userNameSearch" placeholder="Search Username">
        <input type="submit" value="Search">
    </form>
</div>