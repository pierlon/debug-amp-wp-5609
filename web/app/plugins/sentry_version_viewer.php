<?php
/**
 * Plugin Name: Sentry Version Viewer
 * Description: Displays the installed version number of the Composer `sentry/sentry` package.
 */

namespace Sentry_Version_Viewer;

function show_sentry_version() {
    ?>
    <div class="notice notice-info">
        <p>The currently installed version of <code>sentry/sentry</code> is: <b><?php echo \Composer\InstalledVersions::getPrettyVersion('sentry/sentry') ?></b></p>
    </div>
    <?php
}

add_action( 'admin_notices', __NAMESPACE__ . '\show_sentry_version' );
