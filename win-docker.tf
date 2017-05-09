resource "vcd_vapp" "docker-windows-test" {
  count         = 2
  name          = "win-test-dev0${count.index}"
  catalog_name  = "docker"
  template_name = "windows"
  memory        = 4048
  cpus          = 2
  network_name  = "${vcd_network.docker.name}"
  network_href	= "${vcd_network.docker.href}"
  ip 		= "172.17.0.1${count.index}"
}

