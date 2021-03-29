apt_update 'update'

package 'certbot'
package 'python3-certbot-nginx'

cron 'renew ssl certificates' do
  hour '12'
  command '/usr/bin/certbot renew --quiet'
  action :create
end