sudo "sysadmin" do
  group node["authorization"]["sudo"]["groups"]
  user node["authorization"]["sudo"]["users"]
  nopasswd node["authorization"]["sudo"]["passwordless"]
end