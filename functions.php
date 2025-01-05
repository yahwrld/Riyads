<?php
/**
 * My WordPress Theme functions and definitions
 *
 * @package My_WordPress_Theme
 */

if (!function_exists('my_theme_setup')) {
    function my_theme_setup() {
        // Add theme support for features like post thumbnails, menus, etc.
        add_theme_support('post-thumbnails');
        add_theme_support('menus');

        // Register a navigation menu
        register_nav_menus(array(
            'primary' => __('Primary Menu', 'my-theme'),
        ));
    }
}
add_action('after_setup_theme', 'my_theme_setup');

// Enqueue styles and scripts
function my_theme_scripts() {
    wp_enqueue_style('my-theme-style', get_stylesheet_uri());
}
add_action('wp_enqueue_scripts', 'my_theme_scripts');