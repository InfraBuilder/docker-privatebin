# docker-privatebin

Docker image for PrivateBin based on official php image

![Docker Image Size (latest)](https://img.shields.io/docker/image-size/infrabuilder/privatebin/latest) [Dockerfile](https://github.com/InfraBuilder/docker-privatebin/blob/master/Dockerfile)

# Data persistence

To enable data persistence, you should use a volume for the $PRIVATEBIN_DATA_PATH directory (Default "/data")

# Configuration

Here is the list of environment variable ot configure privatebin :
- PRIVATEBIN_NAME : Website title (Default "PrivateBin")
- PRIVATEBIN_DISCUSSION_ENABLE : Enable the discussion mode (Default "true")
- PRIVATEBIN_DISCUSSION_DEFAULT : Default value of discussion checkbox (Default "false")
- PRIVATEBIN_PASSWORD_ENABLE : Enable password option (Default "true")
- PRIVATEBIN_FILEUPLOAD_ENABLE : Enable file upload option (Default "false")
- PRIVATEBIN_BURNAFTERREADING_DEFAULT : Default value of "Burn after reading" checkbox (Default "false")
- PRIVATEBIN_FORMATTER_DEFAULT : Default formatter (Default "plaintext")
- PRIVATEBIN_SYNTAX_HIGHLIGHT_THEME : Syntax Highlight Theme (Default "")
- PRIVATEBIN_SIZE_LIMIT : Max data size, text + file (Default "10485760")
- PRIVATEBIN_TEMPLATE : Frontend template  (Default "bootstrap")
- PRIVATEBIN_NOTICE : Notice message banner (Default "Note: This is a test service: Data may be deleted anytime. Kittens will die if you abuse this service.")
- PRIVATEBIN_LANGUAGE_SELECTION : Enable language selector menu (Default "true")
- PRIVATEBIN_LANGUAGE_DEFAULT : Default language, overriden by browser preference (Default "en")
- PRIVATEBIN_URLSHORTENER_URL : URL Shortener URL (Default "")
- PRIVATEBIN_QRCODE : Enable QrCode generation (Default "true")
- PRIVATEBIN_ICON : Avatar generation for comments (Default "identicon")
- PRIVATEBIN_ZEROBINCOMPATIBILITY : Compatibility mode for ZeroBin migration (Default "false")
- PRIVATEBIN_HTTP_WARNING : Display a warning message if accessed via HTTP without TLS(Default "true")
- PRIVATEBIN_COMPRESSION : Compression mode  (Default "zlib")
- PRIVATEBIN_RATE_LIMIT : time limit between creating pastes or comments from the same IP address in seconds, 0 for no limit (Default "10")
- PRIVATEBIN_REAL_IP_HEADER= HTTP Header containing real IP (Default "X_FORWARDED_FOR")
- PRIVATEBIN_STORAGE : Storage mode, must be filesystem or mysql or sqlite (Default "filesystem")
- PRIVATEBIN_DATA_PATH : Data path (Default "/data")
- PRIVATEBIN_MYSQL_HOST : MySQL host (Default "mysql")
- PRIVATEBIN_MYSQL_DATABASE : MySQL database (Default "privatebin")
- PRIVATEBIN_MYSQL_TABLE_PREFIX : MySQL table prefix (Default "pb_")
- PRIVATEBIN_MYSQL_USERNAME : MySQL username (Default "privatebin")
- PRIVATEBIN_MYSQL_PASSWORD : MySQL password (Default "Y0uMustChang3M3")
- PRIVATEBIN_MYSQL_ATTR_PERSISTENT : Enable MySQL persistent connections (Default "true")
- PRIVATEBIN_SQLITE_DB_PATH : SqLite database path (Default "/data/db.sq3")
- PRIVATEBIN_SQLITE_ATTR_PERSISTENT : Enable SqLite persistent connections (Default "true")

For more information on configuration, see https://github.com/PrivateBin/PrivateBin/wiki/Configuration

# Kubernetes example

See [kubernetes.yml](kubernetes.yml)