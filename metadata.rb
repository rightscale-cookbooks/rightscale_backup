name             'rightscale_backup'
maintainer       'RightScale, Inc.'
maintainer_email 'cookbooks@rightscale.com'
license          'Apache 2.0'
description      'Provides a resource to manage volume backups on any cloud RightScale supports.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.0.0'
issues_url       'https://github.com/rightscale-cookbooks/rightscale_backup/issues' if respond_to?(:issues_url)
source_url       'https://github.com/rightscale-cookbooks/rightscale_backup' if respond_to?(:source_url)
chef_version '>= 12.0' if respond_to?(:chef_version)

depends 'build-essential'
depends 'rightscale_volume', '~> 2.0.0'

recipe 'rightscale_backup::default', 'Default recipe for installing required packages/gems.'
