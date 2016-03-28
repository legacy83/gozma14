Gozma14
=======

Just one more ubuntu/trusty64 vagrant box for all my personal projects. Gozma14 provides a wonderful development environment without requiring me to install PHP, a web server, and any other server software on my local machine. No more worrying about messing up my operating system!

Included Software
-----------------

* Ubuntu 14.04
* PHP 5.5
* Apache2
* MySQL
* Postgres

Included Recipes
----------------

* PHP5 Environment
  * Node (With Bower, Grunt, and Gulp)
* WordPress Environment
  * WP-Cli
  * WP I18N Tools
  * Node (With Bower, Grunt, and Gulp)
* ZendServer Environment
  * Node (With Bower, Grunt, and Gulp)

Cleanup
-------

How to cleanup the box before packaging.

    apt-get clean

    dd if=/dev/zero of=/EMPTY bs=1M
    rm -f /EMPTY

    cat /dev/null > ~/.bash_history && history -c
    

Packaging & Install
-------------------

A sample about how to package the new provisioned box.

    vagrant package
    vagrant box add gozma14/php5 package.box