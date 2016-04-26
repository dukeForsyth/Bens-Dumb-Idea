<?php

// path constants
define('SYSTEM_PATH', dirname(__FILE__)); # location of 'app' folder - don't change
define('BASE_URL','http://localhost/Bens-Dumb-Idea');

// database constants
define('DB_HOST','127.0.0.1');
define('DB_USER','root');
define('DB_PASS','');
define('DB_DATABASE','proj4');

// admin credentials, not used
define('ADMIN_USERNAME', 'admin');
define('ADMIN_PASSWORD', 'mypass');

// date timezone
date_default_timezone_set('UTC');
