<?php
/**
 * Navigation bar template
 *
 * @package My_WordPress_Theme
 */
?>
<nav class="navbar">
    <div class="container">
        <?php
        wp_nav_menu(array(
            'theme_location' => 'primary',
            'menu_class' => 'navbar-menu',
        ));
        ?>
    </div>
</nav>