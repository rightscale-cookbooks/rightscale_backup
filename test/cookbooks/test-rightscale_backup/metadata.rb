name             'test-rightscale_backup'
maintainer       'RightScale, Inc.'
maintainer_email 'cookbooks@rightscale.com'
license          'Apache 2.0'
description      'A wrapper cookbook to test rightscale_backup cookbook'
begin
  version IO.read(File.join(File.dirname(__FILE__), 'VERSION'))
rescue
  '0.1.0'
end

depends 'rightscale_volume'
depends 'rightscale_backup'

recipe 'test-rightscale_backup::test', 'Test recipe for testing rightscale_backup cookbook'
