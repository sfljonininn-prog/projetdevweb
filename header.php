<?php
if (session_status() === PHP_SESSION_NONE) session_start();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parfums Shop - Élixir des sens</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
<header>
    <div class="container header-flex">
        <div class="logo">
            <h1>✨ Parfums Shop</h1>
            <p>L'élixir des sens</p>
        </div>
        <nav>
            <ul>
                <li><a href="index.php">Accueil</a></li>
                <?php if(isset($_SESSION['client_id'])): ?>
                    <li><a href="shop.php">Nos Parfums</a></li>
                    <li><a href="cart.php">Mon Panier 🛒</a></li>
                    <li><a href="logout.php">Déconnexion</a></li>
                    <li><span class="user-welcome">Bonjour, <?= htmlspecialchars($_SESSION['client_nom']) ?></span></li>
                <?php elseif(isset($_SESSION['admin_logged_in'])): ?>
                    <li><a href="admin.php">Dashboard Admin</a></li>
                    <li><a href="logout.php">Déconnexion Admin</a></li>
                <?php else: ?>
                    <li><a href="login.php">Connexion</a></li>
                    <li><a href="register.php">Inscription</a></li>
                <?php endif; ?>
            </ul>
        </nav>
    </div>
</header>
<main>