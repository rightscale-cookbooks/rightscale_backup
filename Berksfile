site :opscode

metadata

cookbook 'build-essential'
cookbook 'rightscale_volume', github:'rightscale-cookbooks/rightscale_volume'

group :integration do
  cookbook "test-rightscale_backup", path: "./test/cookbooks/test-rightscale_backup"
end
