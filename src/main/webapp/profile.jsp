<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profil</title>

        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <!-- Potreba ve vsech .jsp kde pouzivame security:authorize tagy -->
        <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %> 
    </head>
    <body>
        <!-- HEADER -->
        <header>
            <div class="info_bar">
                <security:authorize access="hasAnyRole('ROLE_CUSTOMER','ROLE_EMPLOYEE','ROLE_ADMIN')">
                    <p>${userName}</p>
                </security:authorize>
            </div>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
                <div class="container-fluid">
                    <a class="navbar-brand" href="/"><img class="logo_icon" src="css/images/logo_icon.png"></a>
                    <h1 class="header_title">Tygri Pujcovna</h1>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="/">Domu</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Nabidka aut</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Kontakty</a>
                            </li>
                            <security:authorize access="hasAnyRole('ROLE_CUSTOMER','ROLE_EMPLOYEE','ROLE_ADMIN')">
                                <li class="nav-item active">
                                    <a class="nav-link" href="/profile">Muj Ucet</a>
                                </li>
                            </security:authorize>
                            <li class="nav-item">
                                <security:authorize access="!hasAnyRole('ROLE_CUSTOMER','ROLE_EMPLOYEE','ROLE_ADMIN')">
                                    <a class="nav-link" href="/login">Prihlasit</a>
                                </security:authorize>
                                <security:authorize access="hasAnyRole('ROLE_CUSTOMER','ROLE_EMPLOYEE','ROLE_ADMIN')">
                                    <a class="nav-link" href="/doLogout">Odhlasit</a>
                                </security:authorize>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <!-- END OF HEADER -->

        <!-- MAIN SECTION -->
        <main class="main">

            <div class="container main_description">
                <H1>${session.role}</H1>
                <table class="user_profile_table">
                    <tr>
                        <td>Jmeno a Prijmeni</td>
                        <td>${firstname} ${lastname}</td>
                    </tr>
                    <tr>
                        <td>Telefon</td>
                        <td>${phone}</td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td>${email}</td>
                    </tr>
                    <tr>
                        <td>Adresa</td>
                        <td>${State} ${city} ${street} ${streetno}</td>
                    </tr>
                    <tr>
                        <td>Profile Photo</td>
                        <td>${profilePhoto}</td>
                    </tr>

                    <tr>
                        <td>Objednavky</td>
                        <td>${orders}</td>
                    </tr>
                </table>
                <form method="POST" enctype="multipart/form-data" action="setProfilePhoto">
                    <label>Zmenit profilovou fotku: </label><input type="file" name="photo" required><br>
                    <input type="submit"><br>
                </form>
                ${profilePhotoChangeMsg}
                <%=session.getAttribute("userName")%>
            </div>

        </main>

        <!-- END OF MAIN SECTION -->


        <!-- FOOTER -->
        <footer>
            <div class="footer bottom container-fluid bg-dark fixedBottom">
                <div class="footer_content">
                    <h3 class="footer_title">Kontakty</h3>
                    <table class="footer_table">
                        <tr>
                            <td>Info linka: 800 66 55 66</td>
                        </tr>
                        <tr>
                            <td>Adresa: Tygri 888, Praha</td>
                        </tr>
                    </table>
                </div>
            </div>
        </footer>
        <!-- END OF FOOTER -->

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>