site :opscode

metadata

cookbook 'build-essential', '~> 3.2.0'
cookbook 'rightscale_volume', github:'rightscale-cookbooks/rightscale_volume'

group :integration do
  cookbook "test-rightscale_backup", path: "./test/cookbooks/test-rightscale_backup"
end
