## 3.0.0

* Replaces <https://github.com/TalkingQuickly/mongo-tlq> MongoDB cookbook with community cookbook <https://github.com/edelight/chef-mongodb>
* Replaces custom firewall management with community cookbook <https://github.com/opscode-cookbooks/ufw>
* Replaces custom Memcached cookbook <https://github.com/TalkingQuickly/memcached-tlq> with community cookbook <https://github.com/opscode-cookbooks/memcached>
* Replaces custom Nginx cookbook <https://github.com/miketheman/nginx> with community cookbook <https://github.com/TalkingQuickly/nginx-tlq>
* Replaces custom Redis cookbook <https://github.com/TalkingQuickly/redis-tlq> with the books example cookbook <https://github.com/TalkingQuickly/redis-server>
* Replaces custom fail2ban management with <https://github.com/opscode-cookbooks/fail2ban> community cookbook
* Replaces custom n2p management with <https://github.com/gmiranda23/ntp> community cookbook
* Replaces custom automatic upgrade management with <https://github.com/opscode-cookbooks/apt> community cookbook
* Replaces custom openssh management with <https://github.com/opscode-cookbooks/openssh> community cookbook
* Disables creation of Nginx defauly vhost
* Adds kitchen sink example node definition to demonstrate how to use all roles and for testing