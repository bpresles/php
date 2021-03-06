# PHP Docker Container Images

[![Build Status](https://travis-ci.org/wodby/php.svg?branch=master)](https://travis-ci.org/wodby/php)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/php.svg)](https://hub.docker.com/r/wodby/php)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/php.svg)](https://hub.docker.com/r/wodby/php)
[![Docker Layers](https://images.microbadger.com/badges/image/wodby/php.svg)](https://microbadger.com/images/wodby/php)
[![Wodby Slack](http://slack.wodby.com/badge.svg)](http://slack.wodby.com)

## Table of Contents

* [Docker Images](#docker-images)
* [Environment Variables](#environment-variables)
    * [PHP and PHP-FPM configuration](#php-and-php-fpm-configuration)
    * [Additional configuration](#additional-configuration)
    * [Deprecated environment variables](#deprecated-environment-variables)
* [PHP Extensions](#php-extensions)
* [Tools](#tools)
* [Global Composer Packages](#global-composer-packages)
* [Orchestration Actions](#orchestration-actions)

## Docker Images

* All images are based on Alpine Linux
* Base image: [wodby/alpine](https://github.com/wodby/alpine) for 5.3, [wodby/base-php](https://github.com/wodby/base-php) for the rest
* [Travis CI builds](https://travis-ci.org/wodby/php) 
* [Docker Hub](https://hub.docker.com/r/wodby/php) 

For better reliability we release images with stability tags (`wodby/php:7.1-X.X.X`) which correspond to git tags. We **strongly recommend** using images only with stability tags. Below listed basic tags:

| Image tag (Dockerfile)                                                  | PHP    | Alpine |
| ----------------------------------------------------------------------- | ------ | ------ |
| [7.1 (latest)](https://github.com/wodby/php/tree/master/7.1/Dockerfile) | 7.1.11 | 3.6    |
| [7.0](https://github.com/wodby/php/tree/master/7.0/Dockerfile)          | 7.0.26 | 3.6    |
| [5.6](https://github.com/wodby/php/tree/master/5.6/Dockerfile)          | 5.6.32 | 3.6    |
| [5.3](https://github.com/wodby/php/tree/master/5.3/Dockerfile)          | 5.3.29 | 3.4    |
| [7.1-debug](https://github.com/wodby/php/tree/master/7.1/Dockerfile)    | 7.1.11 | 3.6    |
| [7.0-debug](https://github.com/wodby/php/tree/master/7.0/Dockerfile)    | 7.0.26 | 3.6    |
| [5.6-debug](https://github.com/wodby/php/tree/master/5.6/Dockerfile)    | 5.6.32 | 3.6    |

> Images with -debug tag run php compiled with --enable-debug flag  

> The 5.3 version is no longer supported by PHP team, we highly encourage switching to 5.6 

## Environment Variables

#### PHP and PHP-FPM configuration

[xdebug71]: https://github.com/wodby/php/tree/master/7.1/templates/docker-php-ext-xdebug.ini.tpl
[xdebug70]: https://github.com/wodby/php/tree/master/7.0/templates/docker-php-ext-xdebug.ini.tpl
[xdebug56]: https://github.com/wodby/php/tree/master/5.6/templates/docker-php-ext-xdebug.ini.tpl
[xdebug53]: https://github.com/wodby/php/tree/master/5.3/templates/docker-php-ext-xdebug.ini.tpl
[opcache71]: https://github.com/wodby/php/tree/master/7.1/templates/docker-php-ext-opcache.ini.tpl
[opcache70]: https://github.com/wodby/php/tree/master/7.0/templates/docker-php-ext-opcache.ini.tpl
[opcache56]: https://github.com/wodby/php/tree/master/5.6/templates/docker-php-ext-opcache.ini.tpl
[opcache53]: https://github.com/wodby/php/tree/master/5.3/templates/docker-php-ext-opcache.ini.tpl
[apcu71]: https://github.com/wodby/php/tree/master/7.1/templates/docker-php-ext-apcu.ini.tpl
[apcu70]: https://github.com/wodby/php/tree/master/7.0/templates/docker-php-ext-apcu.ini.tpl

[PHP_ALWAYS_POPULATE_RAW_POST_DATA]: http://php.net/always-populate-raw-post-data
[PHP_APCU_ENABLED]: http://php.net/manual/en/apcu.configuration.php#ini.apcu.enabled
[PHP_ASSERT_ACTIVE]: http://php.net/assert.active
[PHP_DATE_TIMEZONE]: http://php.net/date.timezone
[PHP_DISPLAY_ERRORS]: http://php.net/display-errors
[PHP_DISPLAY_STARTUP_ERRORS]: http://php.net/display-startup-errors
[PHP_ERROR_REPORTING]: http://php.net/error-reporting
[PHP_EXPOSE]: http://php.net/expose-php
[PHP_GEOIP_CUSTOM_DIR]: http://php.net/manual/en/geoip.configuration.php#ini.geoip.custom-directory
[PHP_LOG_ERRORS_MAX_LEN]: http://php.net/log-errors-max-len
[PHP_MAX_EXECUTION_TIME]: http://php.net/max-execution-time  
[PHP_MAX_FILE_UPLOADS]: http://php.net/manual/en/ini.core.php#ini.max-file-uploads
[PHP_MAX_INPUT_TIME]: http://php.net/max-input-time
[PHP_MAX_INPUT_VARS]: http://php.net/max-input-vars
[PHP_MBSTRING_HTTP_INPUT]: http://php.net/mbstring.http-input
[PHP_MBSTRING_HTTP_OUTPUT]: http://php.net/mbstring.http-output
[PHP_MBSTRING_ENCODING_TRANSLATION]: http://php.net/mbstring.encoding-translation
[PHP_MEMORY_LIMIT]: http://php.net/memory-limit
[PHP_MYSQLI_CACHE_SIZE]: http://php.net/mysqli.cache_size
[PHP_OPCACHE_ENABLE]: http://php.net/manual/en/opcache.configuration.php#ini.opcache.enable
[PHP_OUTPUT_BUFFERING]: http://php.net/output-buffering
[PHP_PDO_MYSQL_CACHE_SIZE]: http://php.net/pdo_mysql.cache_size
[PHP_ZEND_ASSERTIONS]: http://php.net/zend.assertions
[PHP_XDEBUG_DEFAULT_ENABLE]: https://xdebug.org/docs/all_settings
[PHP_UPLOAD_MAX_FILESIZE]: http://php.net/upload-max-filesize
[PHP_TRACK_ERRORS]: http://php.net/track-errors
[PHP_SESSION_AUTO_START]: http://php.net/session.auto-start
[PHP_SESSION_BUG_COMPAT_42]: http://php.net/session.bug-compat-42
[PHP_SESSION_BUG_COMPAT_WARN]: http://php.net/session.bug-compat-warn
[PHP_SENDMAIL_PATH]: http://php.net/sendmail-path
[PHP_REALPATH_CACHE_SIZE]: http://php.net/realpath-cache-size
[PHP_REALPATH_CACHE_TTL]: http://php.net/realpath-cache-ttl
[PHP_POST_MAX_SIZE]: http://php.net/post-max-size
[PHP_FPM_CLEAR_ENV]: http://php.net/manual/en/install.fpm.configuration.php#clear-env
[PHP_FPM_LOG_LEVEL]: http://php.net/manual/en/install.fpm.configuration.php#log-level
[PHP_FPM_PM]: http://php.net/manual/en/install.fpm.configuration.php#pm
[PHP_FPM_PM_MAX_CHILDREN]: http://php.net/manual/en/install.fpm.configuration.php#pm.max-chidlren
[PHP_FPM_PM_MAX_REQUESTS]: http://php.net/manual/en/install.fpm.configuration.php#pm.max-requests
[PHP_FPM_PM_MAX_SPARE_SERVERS]: http://php.net/manual/en/install.fpm.configuration.php#pm.max-spare-servers
[PHP_FPM_PM_MIN_SPARE_SERVERS]: http://php.net/manual/en/install.fpm.configuration.php#pm.min-spare-servers
[PHP_FPM_PM_STATUS_PATH]: http://php.net/manual/en/install.fpm.configuration.php#pm.status-path
[PHP_FPM_REQUEST_SLOWLOG_TIMEOUT]: http://php.net/manual/en/install.fpm.configuration.php#request-slowlog-timeout
[PHP_FPM_START_SERVERS]: http://php.net/manual/en/install.fpm.configuration.php#pm.start-servers
[PHP_FPM_USER]: http://php.net/manual/en/install.fpm.configuration.php#user
[PHP_FPM_GROUP]: http://php.net/manual/en/install.fpm.configuration.php#group

The default configuration is not recommended to be used for production environment:

| Variable                              | 7.1         | 7.0         | 5.6         | 5.3         |
| ------------------------------------- | ----------- | ----------- | ----------- | ----------- |
| [PHP_ALWAYS_POPULATE_RAW_POST_DATA]   | -           | -           | 0           | 0           |
| [PHP_APCU_ENABLED]                    | 1           | 1           | -           | -           |
| _SEE ALL APCU EXT OPTIONS_            | [apcu71]    | [apcu70]    | -           | -           |
| [PHP_ASSERT_ACTIVE]                   | On          | On          | On          | On          |
| PHP_BLACKFIRE                         |             |             |             | -           |
| PHP_BLACKFIRE_AGENT_HOST              | blackfire   | blackfire   | blackfire   | -           |
| PHP_BLACKFIRE_AGENT_PORT              | 8707        | 8707        | 8707        | -           |
| PHP_CLI_MEMORY_LIMIT                  | -1          | -1          | -1          | -1          |
| [PHP_DATE_TIMEZONE]                   | UTC         | UTC         | UTC         | UTC         |
| [PHP_DISPLAY_ERRORS]                  | On          | On          | On          | On          |
| [PHP_DISPLAY_STARTUP_ERRORS]          | On          | On          | On          | On          |
| [PHP_ERROR_REPORTING]                 | E_ALL       | E_ALL       | E_ALL       | E_ALL       |
| [PHP_EXPOSE]                          | Off         | Off         | Off         | Off         |
| [PHP_FPM_CLEAR_ENV]                   | yes         | yes         | yes         | -           |
| PHP_FPM_ENV_VARS                      |             |             |             |             |
| [PHP_FPM_LOG_LEVEL]                   | notice      | notice      | notice      | notice      |
| [PHP_FPM_PM]                          | dynamic     | dynamic     | dynamic     | dynamic     |
| [PHP_FPM_PM_MAX_CHILDREN]             | 8           | 8           | 8           | 8           |
| [PHP_FPM_PM_MAX_REQUESTS]             | 500         | 500         | 500         | 500         |
| [PHP_FPM_PM_MAX_SPARE_SERVERS]        | 3           | 3           | 3           | 3           |
| [PHP_FPM_PM_MIN_SPARE_SERVERS]        | 1           | 1           | 1           | 1           |
| [PHP_FPM_PM_STATUS_PATH]              |             |             |             |             |
| [PHP_FPM_REQUEST_SLOWLOG_TIMEOUT]     |             |             |             |             |
| [PHP_FPM_START_SERVERS]               | 2           | 2           | 2           | 2           |
| [PHP_FPM_USER]                        |             |             |             |             |
| [PHP_FPM_GROUP]                       |             |             |             |             |
| [PHP_GEOIP_CUSTOM_DIR]                |             |             |             | -           |
| [PHP_LOG_ERRORS_MAX_LEN]              | 1024        | 1024        | 1024        | 1024        |
| [PHP_MAX_EXECUTION_TIME]              | 120         | 120         | 120         | 120         |
| [PHP_MAX_FILE_UPLOADS]                | 20          | 20          | 20          | 20          |
| [PHP_MAX_INPUT_TIME]                  | 60          | 60          | 60          | 60          |
| [PHP_MAX_INPUT_VARS]                  | 2000        | 2000        | 2000        | 2000        |
| [PHP_MBSTRING_HTTP_INPUT]             | -           | -           |             |             |
| [PHP_MBSTRING_HTTP_OUTPUT]            | -           | -           |             |             |
| [PHP_MBSTRING_ENCODING_TRANSLATION]   | -           | -           | Off         | Off         |
| [PHP_MEMORY_LIMIT]                    | 512M        | 512M        | 512M        | 512M        |
| PHP_MYSQL_CACHE_SIZE                  | -           | -           | 2000        | 2000        |
| [PHP_MYSQLI_CACHE_SIZE]               | 2000        | 2000        | 2000        | 2000        |
| [PHP_OPCACHE_ENABLE]                  | 1           | 1           | 1           | 1           |
| _SEE ALL OPCACHE EXT OPTIONS_         | [opcache71] | [opcache70] | [opcache56] | [opcache53] |
| [PHP_OUTPUT_BUFFERING]                | 4096        | 4096        | 4096        | 4096        |
| [PHP_PDO_MYSQL_CACHE_SIZE]            | 2000        | 2000        | 2000        | 2000        |
| [PHP_POST_MAX_SIZE]                   | 32M         | 32M         | 32M         | 32M         |
| [PHP_REALPATH_CACHE_SIZE]             | 4096k       | 4096k       | 16k         | 16k         |
| [PHP_REALPATH_CACHE_TTL]              | 120         | 120         | 120         | 120         |
| [PHP_SENDMAIL_PATH]                   | /bin/true   | /bin/true   | /bin/true   | /bin/true   |
| [PHP_SESSION_AUTO_START]              | 0           | 0           | 0           | 0           |
| [PHP_SESSION_BUG_COMPAT_42]           | -           | -           | -           | On          |
| [PHP_SESSION_BUG_COMPAT_WARN]         | -           | -           | -           | On          |
| [PHP_TRACK_ERRORS]                    | -           | -           | -           | On          |
| [PHP_UPLOAD_MAX_FILESIZE]             | 32M         | 32M         | 32M         | 32M         |
| PHP_XDEBUG                            |             |             |             |             |
| [PHP_XDEBUG_DEFAULT_ENABLE]           | 0           | 0           | 0           | 0           |
| _SEE ALL XDEBUG EXT OPTIONS_          | [xdebug71]  | [xdebug70]  | [xdebug56]  | [xdebug53]  |
| [PHP_ZEND_ASSERTIONS]                 | 1           | 1           | 1           | -           |

> "-" - Not available for this version

#### Additional configuration

| Variable                        | Default value        |
| ------------------------------- | -------------------- |
| GIT_USER_EMAIL                  | www-data@example.com |
| GIT_USER_NAME                   | www-data             |
| SSH_PRIVATE_KEY                 |                      |
| SSH_DISABLE_STRICT_KEY_CHECKING |                      |
| SSHD_GATEWAY_PORTS              | no                   |
| SSHD_HOST_KEYS_DIR              | /etc/ssh             |
| SSHD_LOG_LEVEL                  | INFO                 |
| SSHD_PASSWORD_AUTHENTICATION    | no                   |
| SSHD_PERMIT_USER_ENV            | no                   |
| SSHD_USE_DNS                    | yes                  |

#### Deprecated environment variables

Deprecated variables still supported but will be removed in future releases 

| Deprecated                      | Instead use                     |
| ------------------------------- | ------------------------------- |
| PHP_APCU_ENABLE                 | PHP_APCU_ENABLED                |
| PHP_FPM_SLOWLOG_TIMEOUT         | PHP_FPM_REQUEST_SLOWLOG_TIMEOUT |
| PHP_FPM_MAX_CHILDREN            | PHP_FPM_PM_MAX_CHILDREN         |
| PHP_FPM_START_SERVERS           | PHP_FPM_PM_START_SERVERS        |
| PHP_FPM_MIN_SPARE_SERVERS       | PHP_FPM_PM_MIN_SPARE_SERVERS    |
| PHP_FPM_MAX_SPARE_SERVERS       | PHP_FPM_PM_MAX_SPARE_SERVERS    |
| PHP_FPM_MAX_REQUESTS            | PHP_FPM_PM_MAX_REQUESTS         |
| PHP_FPM_STATUS_PATH             | PHP_FPM_PM_STATUS_PATH          |

## PHP Extensions

[amqp]: http://pecl.php.net/package/amqp
[apcu]: http://pecl.php.net/package/apcu
[ast]: https://github.com/nikic/php-ast
[geoip]: https://pecl.php.net/package/geoip
[imagick]: https://pecl.php.net/package/imagick
[memcached]: http://pecl.php.net/package/memcached
[mongo]: http://pecl.php.net/package/mongo
[mongodb]: http://pecl.php.net/package/mongodb
[OAuth]: http://pecl.php.net/package/oauth
[redis]: http://pecl.php.net/package/redis
[uploadprogress]: https://pecl.php.net/package/uploadprogress
[uploadprogress]: https://pecl.php.net/package/uploadprogress
[xdebug]: https://pecl.php.net/package/xdebug
[yaml]: https://pecl.php.net/package/yaml
[latest]: https://github.com/wodby/pecl-php-uploadprogress/releases/tag/latest
[7.0.5]: https://pecl.php.net/package/ZendOpcache
[blackfire]: https://blackfire.io/dashboard/mine/profiles

| Extension        | 7.1      | 7.0      | 5.6      | 5.3      |
| ---------------- | -------- | -------- | -------- | -------- |
| [amqp]           | 1.9.1    | 1.9.1    | 1.9.1    | 1.9.1    |
| apc              | -        | -        | -        |          |
| [apcu]           | 5.1.8    | 5.1.8    | 4.0.11   | 4.0.11   |
| [ast]            | 0.1.6    | 0.1.6    | -        | -        |
| [blackfire]      | latest   | latest   | latest   | -        |
| bcmath           |          |          |          |          |
| bz2              |          |          |          |          |
| calendar         |          |          |          |          |
| Core             |          |          |          |          |
| ctype            |          |          |          |          |
| curl             |          |          |          |          |
| date             |          |          |          |          |
| dom              |          |          |          |          |
| exif             |          |          |          |          |
| ereg             | -        | -        |          |          |
| fileinfo         |          |          |          |          |
| filter           |          |          |          |          |
| ftp              |          |          |          |          |
| gd               |          |          |          |          |
| [geoip]          | 1.1.1    | 1.1.1    | 1.1.1    | -        |
| hash             |          |          |          |          |
| iconv            |          |          |          |          |
| [imagick]        | 3.4.3    | 3.4.3    | 3.4.3    | -        |
| imap             |          |          |          |          |
| intl             |          |          |          |          |
| json             |          |          |          |          |
| ldap             |          |          |          |          |
| libxml           |          |          |          |          |
| mbstring         |          |          |          |          |
| mcrypt           |          |          |          |          |
| [memcached]      | 3.0.4    | 3.0.4    | 2.2.0    | 2.2.0    |
| [mongo]          | -        | -        | -        | 1.6.16   |
| [mongodb]        | 1.3.2    | 1.3.2    | 1.3.2    | -        |
| mysql            | -        | -        |          |          |
| mysqli           |          |          |          |          |
| mysqlnd          |          |          |          |          |
| [OAuth]          | 2.0.2    | 2.0.2    | 1.2.3    | 1.2.3    |
| openssl          |          |          |          |          |
| pcntl            |          |          |          |          |
| pcre             |          |          |          |          |
| PDO              |          |          |          |          |
| pdo_mysql        |          |          |          |          |
| pdo_pgsql        |          |          |          |          |
| pdo_sqlite       |          |          |          |          |
| pgsql            |          |          |          |          |
| Phar             |          |          |          |          |
| posix            |          |          |          |          |
| readline         |          |          |          |          |
| [redis]          | 3.1.4    | 3.1.4    | 3.1.4    | -        |
| Reflection       |          |          |          |          |
| session          |          |          |          |          |
| SimpleXML        |          |          |          |          |
| soap             |          |          |          |          |
| sockets          |          |          |          |          |
| SPL              |          |          |          |          |
| SQLite           | -        | -        | -        |          |
| sqlite3          |          |          |          |          |
| standard         |          |          |          |          |
| tokenizer        |          |          |          |          |
| [uploadprogress] | [latest] | [latest] | 1.0.3.1  | 1.0.3.1  |
| [xdebug]         | 2.5.5    | 2.5.5    | 2.5.5    | 2.2.7    |
| xml              |          |          |          |          |
| xmlreader        |          |          |          |          |
| xmlrpc           |          |          |          |          |
| xmlwriter        |          |          |          |          |
| xsl              |          |          |          |          |
| [yaml]           | 2.0.2    | 2.0.2    | 1.3.1    | 1.3.1    |
| Zend OPcache     |          |          |          | [7.0.5]  |
| zip              |          |          |          |          |
| zlib             |          |          |          |          |

Legend:

> - [EMPTY] – Core PHP extension
> - "-" - Not exists in this version

Extensions xdebug and blackfire disabled by default.

## Tools

| Tool                                          | 7.1     | 7.0     | 5.6     | 5.3     |
| --------------------------------------------- | ------- | ------- | ------- | ------- |
| [Composer](https://getcomposer.org)           | latest  | latest  | latest  | latest  |
| [Walter](https://github.com/walter-cd/walter) | 1.3.0   | 1.3.0   | 1.3.0   | 1.3.0   |

## Global Composer Packages

| Package                                                               | Version |
| --------------------------------------------------------------------- | ------- |
| [hirak/prestissimo](https://packagist.org/packages/hirak/prestissimo) | ^0.3    |

## Orchestration Actions

Usage:
```
make COMMAND [params ...]

commands:
    check-ready [host max_try wait_seconds delay_seconds]
    git-clone url [branch]
    git-checkout target [is_hash]   
    update-keys
    walter

default params values:
    is_hash 0
    branch "" Branch, tag or hash commit
```
