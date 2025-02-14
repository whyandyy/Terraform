data "vkcs_networking_network" "extrnl" {

}

resource "vkcs_networking_network" "Fedorov-An" {
   name       = "ITHUBterraformnetwork-Fedorov-An"

}

resource "vkcs_networking_subnet" "Fedorov-An" {
   name       = "ITHUBterraformsubnet-Fedorov-An"
   network_id = vkcs_networking_network.Fedorov-An.id
   cidr       = "192.168.254.0/24"
   depends_on = [vkcs_networking_network.Fedorov-An]
}

resource "vkcs_networking_router" "Fedorov-An" {
   name       = "ITHUBterraformrouter-Fedorov-An"


   depends_on = [vkcs_networking_subnet.Fedorov-An]
}

resource "vkcs_networking_router_interface" "Fedorov-An" {
   router_id  = vkcs_networking_router.Fedorov-An.id
   subnet_id  = vkcs_networking_subnet.Fedorov-An.id
}