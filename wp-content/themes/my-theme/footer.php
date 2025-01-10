<?php
/**
 * The footer for our theme
 *
 * @package My_WordPress_Theme
 */
?>
    <footer>
        <?php get_template_part('footer-widgets'); ?>
        <div class="container">
            <p>&copy; <?php echo date('Y'); ?> <?php bloginfo('name'); ?>. All rights reserved.</p>
        </div>
    </footer>
    <?php wp_footer(); ?>
</body>
</html>